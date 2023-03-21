# DevSecOps - An INSECURE Repo

This repo is used for testing DevSecOps practices and tool sets, and is used for demonstration purposes only. If there is a tool you would like to see added, please submit a [Feature Request Issue](https://github.com/AErmie/DevSecOps/issues/new/choose) with the details about the tool.

This repo contains both [Azure Pipeline YAML files](https://github.com/AErmie/DevSecOps/tree/main/azure-pipelines) and [GitHub Actions YAML files](https://github.com/AErmie/DevSecOps/tree/main/.github/workflows), for comparison purposes.

The application code is based on the [Microsoft eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) sample application. This is self-contained within the `Application-Source-Code` directory.

> **Warning**
> This repo contains code that is purposefully **vulnerable** and **insecure**. Use at your own risk!

## Directories

There are several directories that contain additional/other sample code, specific to **infrastructure** and **security** pipelines.

For example, the `Infrastructure-Source-Code` directory, contains ARM templates, Bicep templates, and Terraform code, that is not specific to the application source code itself. The `Security-Source-Code` directory, contains files that include credentials and secrets, again, not specific to the application source code itself.

The `Threat-Modeling` directory contains examples of threat-modeling-as-code tools, which is not related to the application source code.

## Pipelines

The pipelines are grouped into the following categories:

- APP - Application pipelines (ie. unit tests, builds, source code analysis, etc.)
- DATA - Data pipelines (ie. data quality tests, data migrations, ETLs, etc.)
- INFRA - Infrastructure pipelines (ie. Terraform scans, ARM/Bicep template tests, etc.)
- SEC - Security pipelines (ie. security scans, credential/secret scans, container image scans, etc.)

The GitHub Action Workflows use the pipeline categories as a prefix, for grouping purposes.

## Azure DevOps (ADO) Pipelines

The following YAML-based Azure DevOps (ADO) pipelines have been created and tested.

### Application Pipelines

- [Unit, Integration, Functional Tests](./azure-pipelines/eShopOnWeb-CI.yml)
- [Build Docker Containers](./azure-pipelines/eShopOnWeb-Docker-CI.yml) (using Docker Compose)
- [Azure Resource Manager (ARM) Template Tool Kit (TTK)](azure-pipelines/arm-ttk-pipeline.yml)
- [Azure Bicep](azure-pipelines/azure-bicep-pipeline.yml)
- [SonarCloud](azure-pipelines/sonar-cloud-pipeline.yml)
- [WhiteSource](azure-pipelines/whitesource-pipeline.yml)
  - Note: This pipeline is no longer working since WhiteSource has been acquired by Mend.

### Data Pipelines

- PENDING EXAMPLES / SAMPLE CODE
  - If you would like to contribute, and have some example data pipelines (ie. data quality tests, data migrations, ETLs, etc.), please submit a [Feature Request Issue](https://github.com/AErmie/DevSecOps/issues/new/choose) with the details.

### Infrastructure Pipelines

> Note: The majority of these are based on Terraform code

- [Accurics TerraScan](azure-pipelines/terraform-terrascan-pipeline.yml)
- [GitHub Super-Linter](azure-pipelines/terraform-githublinter-pipeline.yml)
- [Checkmarx KICS](azure-pipelines/iac-kicks-pipeline.yml)
- [Bridgecrew Checkov](azure-pipelines/terraform-checkov-pipeline.yml)
- [Terraform-Compliance](azure-pipelines/terraform-tfcompliance-pipeline.yml)
- [TFLint](azure-pipelines/terraform-tflint.yml)
- [TFSec](azure-pipelines/terraform-tfsec-pipeline.yml)

### Security Pipelines

- [Anchore](azure-pipelines/anchore-pipeline.yml)
  - NOTE: Anchore is deprecated in favour of [Grype](https://github.com/anchore/grype)
- [AquaSec Trivy](azure-pipelines/sec-trivy-pipeline.yml)
- [Microsoft CredScan](azure-pipelines/msft-credscan-pipeline.yml)
  - NOTE: CredScan is deprecated (as an individual tool), in favour of the [Microsoft Secure Azure DevOps extension](https://learn.microsoft.com/en-us/azure/defender-for-cloud/azure-devops-extension)
- [Microsoft Secure Azure DevOps](azure-pipelines/msdevopssec.yml)
- [OWASP ZAP](azure-pipelines/sec-owasp-pipeline.yml)
- [Snyk](azure-pipelines/snyk-securityScan-pipeline.yml)
- [YELP Detect-Secrets](azure-pipelines/sec-secretscan-yelpdetectsecrets.yml)
- [TruffleHog](azure-pipelines/truffleHog-secretScan-pipeline.yml)
- [ShiftLeftScan](azure-pipelines/sec-shiftleftscan-pipeline.yml)

## GitHub Actions (GHA) Workflows

The following YAML-based GitHub Actions (GHA) Workflows have been created and tested.

### Application Workflows

- [CodeQL Analysis](.github/workflows/codeql_analysis-workflow.yml) [![GitHub CodeQL](https://github.com/AErmie/DevSecOps/actions/workflows/codeql_analysis-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/codeql_analysis-workflow.yml)
- [Azure Resource Manager (ARM) Template Tool Kit (TTK)](.github/workflows/armttk-workflow.yml) (NOT WORKING)
    - [![ARM TTK](https://github.com/AErmie/DevSecOps/actions/workflows/armttk-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/armttk-workflow.yml)
- [Codacy](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/codacy-workflow.yml) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/06a8a105132643e0ad4073eec9b85fbd)](https://www.codacy.com/gh/AErmie/DevSecOps/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=AErmie/DevSecOps&amp;utm_campaign=Badge_Grade)

### Data Workflows

- PENDING EXAMPLES / SAMPLE CODE
  - If you would like to contribute, and have some example data pipelines (ie. data quality tests, data migrations, ETLs, etc.), please submit a [Feature Request Issue](https://github.com/AErmie/DevSecOps/issues/new/choose) with the details.

### Infrastructure Workflows

- [Accurics TerraScan](.github/workflows/terrascan-workflow.yml) [![Accurics TerraScan](https://github.com/AErmie/DevSecOps/actions/workflows/terrascan-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/terrascan-workflow.yml)
- [Checkmarx KICS](.github/workflows/kics.yml) [![Checkmarx KICS](https://github.com/AErmie/DevSecOps/actions/workflows/kics-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/kics-workflow.yml)
- [Bridgecrew Checkov](.github/workflows/checkov-workflow.yml) [![BridgeCrew Checkov](https://github.com/AErmie/DevSecOps/actions/workflows/checkov-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/checkov-workflow.yml)
- [GitHub Super-Linter](.github/workflows/github_superlinter-workflow.yml)
- [TFLint](.github/workflows/tflint-workflow.yml) [![TFLint](https://github.com/AErmie/DevSecOps/actions/workflows/tflint-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/tflint-workflow.yml)
- [TFSec](.github/workflows/tfsec-workflow.yml) [![TFSec](https://github.com/AErmie/DevSecOps/actions/workflows/tfsec-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/tfsec-workflow.yml)

### Security Workflows

- [Anchore](.github/workflows/anchore-workflow.yml) [![Anchore Container Image Scan](https://github.com/AErmie/DevSecOps/actions/workflows/anchore-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/anchore-workflow.yml)
- [AquaSec Trivy](.github/workflows/trivy-workflow.yml) [![AquaSec Trivy Container Image Scan](https://github.com/AErmie/DevSecOps/actions/workflows/trivy-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/trivy-workflow.yml)
- [Microsoft Security DevOps (MSDO)](.github/workflows/msdevopssec-workflow.yml)
- [ShiftLeftScan](.github/workflows/shiftleftscan-workflow.yml) [![ShiftLeftSecurity Scan](https://github.com/AErmie/DevSecOps/actions/workflows/shiftleftscan-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/shiftleftscan-workflow.yml)
- [TruffleHog](.github/workflows/truffleHog-workflow.yml) [![TruffleHog Secrets Scan](https://github.com/AErmie/DevSecOps/actions/workflows/truffleHog-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/truffleHog-workflow.yml)
- [YELP Detect-Secrets](.github/workflows/yelp_detectsecrets-workflow.yml) [![YELP Detect-Secrets](https://github.com/AErmie/DevSecOps/actions/workflows/yelp_detectsecrets-workflow.yml/badge.svg?branch=main)](https://github.com/AErmie/DevSecOps/actions/workflows/yelp_detectsecrets-workflow.yml)

### Threat Modeling Workflows

- [PlantUML](.github/workflows/plantUML-workflow.yml)
- [PyTM](.github/workflows/pytm-workflow.yml)
- [Threagile](.github/workflows/threagile-workflow.yml)
