# A PowerShell script that adds the latest version of the Azure Artifacts credential provider
# plugin for Dotnet and/or NuGet to ~/.nuget/plugins directory
# To install netcore, run installcredprovider.ps1
# To install netcore and netfx, run installcredprovider.ps1 -AddNetfx
# To overwrite existing plugin with the latest version, run installcredprovider.ps1 -Force
# To use a specific version of a credential provider, run installcredprovider.ps1 -Version "0.1.17" or installcredprovider.ps1 -Version "0.1.17" -Force
# More: https://github.com/Microsoft/artifacts-credprovider/blob/master/README.md

param(
    # whether or not to install netfx folder for nuget
    [switch]$AddNetfx,
    # override existing cred provider with the latest version
    [switch]$Force,
    # install the version specified
    [string]$Version
)

$script:ErrorActionPreference='Stop'

# Without this, System.Net.WebClient.DownloadFile will fail on a client with TLS 1.0/1.1 disabled
if ([Net.ServicePointManager]::SecurityProtocol.ToString().Split(',').Trim() -notcontains 'Tls12') {
    [Net.ServicePointManager]::SecurityProtocol += [Net.SecurityProtocolType]::Tls12
}

$profilePath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile)
$tempPath = [System.IO.Path]::GetTempPath()

$pluginLocation = [System.IO.Path]::Combine($profilePath, ".nuget", "plugins");
$tempZipLocation = [System.IO.Path]::Combine($tempPath, "CredProviderZip");

$localNetcoreCredProviderPath = [System.IO.Path]::Combine("netcore", "CredentialProvider.Microsoft");
$localNetfxCredProviderPath = [System.IO.Path]::Combine("netfx", "CredentialProvider.Microsoft");

$fullNetfxCredProviderPath = [System.IO.Path]::Combine($pluginLocation, $localNetfxCredProviderPath)
$fullNetcoreCredProviderPath = [System.IO.Path]::Combine($pluginLocation, $localNetcoreCredProviderPath)

$netfxExists = Test-Path -Path ($fullNetfxCredProviderPath)
$netcoreExists = Test-Path -Path ($fullNetcoreCredProviderPath)

# Check if plugin already exists if -Force swich is not set
if (!$Force) {
    if ($AddNetfx -eq $True -and $netfxExists -eq $True -and $netcoreExists -eq $True) {
        Write-Host "The netcore and netfx Credential Providers are already in $pluginLocation"
        return
    }

    if ($AddNetfx -eq $False -and $netcoreExists -eq $True) {
        Write-Host "The netcore Credential Provider is already in $pluginLocation"
        return
    }
}

# Get the zip file from the GitHub release
$releaseUrlBase = "https://api.github.com/repos/Microsoft/artifacts-credprovider/releases"
$versionError = "Unable to find the release version $Version from $releaseUrlBase"
$releaseId = "latest"
if (![string]::IsNullOrEmpty($Version)) {
    try {
        $releases = Invoke-WebRequest -UseBasicParsing $releaseUrlBase
        $releaseJson = $releases | ConvertFrom-Json
        $correctReleaseVersion = $releaseJson | ? { $_.name -eq $Version }
        $releaseId = $correctReleaseVersion.id
    } catch {
        Write-Error $versionError
        return
    }
}

if (!$releaseId) {
    Write-Error $versionError
    return
}

$releaseUrl = [System.IO.Path]::Combine($releaseUrlBase, $releaseId)
$releaseUrl = $releaseUrl.Replace("\","/")

$zipFile = "Microsoft.NetCore2.NuGet.CredentialProvider.zip"
if ($AddNetfx -eq $True) {
    $zipFile = "Microsoft.NuGet.CredentialProvider.zip"
}
Write-Verbose "Using $zipFile"

$zipErrorString = "Unable to resolve the Credential Provider zip file from $releaseUrl"
try {
    Write-Host "Fetching release $releaseUrl"
    $release = Invoke-WebRequest -UseBasicParsing $releaseUrl
    $releaseJson = $release.Content | ConvertFrom-Json
    $zipAsset = $releaseJson.assets | ? { $_.name -eq $zipFile }
    $packageSourceUrl = $zipAsset.browser_download_url
} catch {
    Write-Error $zipErrorString
    return
}

if (!$packageSourceUrl) {
    Write-Error $zipErrorString
    return
}

# Create temporary location for the zip file handling
Write-Verbose "Creating temp directory for the Credential Provider zip: $tempZipLocation"
if (Test-Path -Path $tempZipLocation) {
    Remove-Item $tempZipLocation -Force -Recurse
}
New-Item -ItemType Directory -Force -Path $tempZipLocation

# Download credential provider zip to the temp location
$pluginZip = ([System.IO.Path]::Combine($tempZipLocation, $zipFile))
Write-Host "Downloading $packageSourceUrl to $pluginZip"
try {
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($packageSourceUrl, $pluginZip)
} catch {
    Write-Error "Unable to download $packageSourceUrl to the location $pluginZip"
}

# Extract zip to temp directory
Write-Host "Extracting zip to the Credential Provider temp directory $tempZipLocation"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($pluginZip, $tempZipLocation)

# Remove existing content and copy netcore (and netfx) directories to plugins directory
if ($netcoreExists) {
    Write-Verbose "Removing existing content from $fullNetcoreCredProviderPath"
    Remove-Item $fullNetcoreCredProviderPath -Force -Recurse
}
$tempNetcorePath = [System.IO.Path]::Combine($tempZipLocation, "plugins", $localNetcoreCredProviderPath)
Write-Verbose "Copying Credential Provider from $tempNetcorePath to $fullNetcoreCredProviderPath"
Copy-Item $tempNetcorePath -Destination $fullNetcoreCredProviderPath -Force -Recurse
if ($AddNetfx -eq $True) {
    if ($netfxExists) {
        Write-Verbose "Removing existing content from $fullNetfxCredProviderPath"
        Remove-Item $fullNetfxCredProviderPath -Force -Recurse
    }
    $tempNetfxPath = [System.IO.Path]::Combine($tempZipLocation, "plugins", $localNetfxCredProviderPath)
    Write-Verbose "Copying Credential Provider from $tempNetfxPath to $fullNetfxCredProviderPath"
    Copy-Item $tempNetfxPath -Destination $fullNetfxCredProviderPath -Force -Recurse
}

# Remove $tempZipLocation directory
Write-Verbose "Removing the Credential Provider temp directory $tempZipLocation"
Remove-Item $tempZipLocation -Force -Recurse

Write-Host "Credential Provider installed successfully"