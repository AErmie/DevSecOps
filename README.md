# DevSecOps - An INSECURE Repo

This repo is used for testing DevSecOps practices and tool sets, and is used for demonstration purposes only. If there is a tool you would like to see added, please submit a [Feature Request Issue](https://github.com/AErmie/DevSecOps/issues/new/choose) with the details about the tool.

This repo contains both [Azure Pipeline YAML files](https://github.com/AErmie/DevSecOps/tree/main/azure-pipelines) and [GitHub Actions YAML files](https://github.com/AErmie/DevSecOps/tree/main/.github/workflows), for comparison purposes.

The application code is based on the [Microsoft eShopOnWeb](https://github.com/dotnet-architecture/eShopOnWeb) sample application. This is self-contained within the `Application-Source-Code` directory.

> **Warning**
> This repo contains code that is purposefully **vulnerable** and **insecure**. Use at your own risk!

## Directories

There are several directorie that contain additional/other sample code, specific to **infrastructure** and **security** pipelines.

For example, the Infrastructure-Source-Code directory, contains ARM templates, Bicep templates, and Terraform code, that is not specific to the application source code. The Security-Source-Code directory, contains files that include credentails and secrets.

The Threat-Modeling directory contains examples of threat-modeling-as-code tools, which is not related to the application source code.

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

- [Unit, Integration, Functional Tests](eShopOnWeb-CI.yml)
- [Build and Publish Docker Container](eShopOnWeb-Docker-CI.yml)
- [Azure Resource Manager (ARM) Template Tool Kit (TTK)](azure-pipelines/arm-ttk-pipeline.yml)
- [Azure Bicep](azure-pipelines/azure-bicep-pipeline.yml) (INCOMPLETE)
- [SonarCloud](azure-pipelines/sonar-cloud-pipeline.yml) [![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=randomprojectkey) [![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=randomprojectkey) [![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=security_rating)](https://sonarcloud.io/dashboard?id=randomprojectkey) [![Bugs](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=bugs)](https://sonarcloud.io/dashboard?id=randomprojectkey) [![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=code_smells)](https://sonarcloud.io/dashboard?id=randomprojectkey)
- [WhiteSource](azure-pipelines/whitesource-pipeline.yml)

### Data Pipelines

- PENDING EXAMPLES/SAMPLE CODE

### Infrastructure Pipelines

- [Accurics TerraScan](azure-pipelines/terraform-terrascan-pipeline.yml)
- [GitHub Super-Linter](azure-pipelines/terraform-githublinter-pipeline.yml)
- [Checkmarx KICS](azure-pipelines/iac-kicks-pipeline.yml)
- [Bridgecrew Checkov](azure-pipelines/terraform-checkov-pipeline.yml)
- [Terraform-Compliance](azure-pipelines/terraform-tfcompliance-pipeline.yml)
- [TFLint](azure-pipelines/terraform-tflint.yml)
- [TFSec](azure-pipelines/terraform-tfsec-pipeline.yml)

### Security Pipelines

- [Anchore](azure-pipelines/anchore-pipeline.yml)
- [AquaSec Trivy](azure-pipelines/sec-trivy-pipeline.yml)
- [Microsoft CredScan](azure-pipelines/msft-credscan-pipeline.yml)
- [OWASP ZAP](azure-pipelines/sec-owasp-pipeline.yml)
- [Snyk](azure-pipelines/snyk-securityScan-pipeline.yml)
- [YELP Detect-Secrets](azure-pipelines/sec-secretscan-yelpdetectsecrets.yml)
- [TruffleHog](azure-pipelines/truffleHog-secretScan-pipeline.yml) (INCOMPLETE)
- [ShiftLeftScan](azure-pipelines/sec-shiftleftscan-pipeline.yml)

## GitHub Actions (GHA) Workflows

The following YAML-based GitHub Actions (GHA) Workflows have been created and tested.

### Application Pipelines

- [CodeQL Analysis](.github/workflows/codeql-analysis.yml) [![GitHub CodeQL](https://github.com/AErmie/DevSecOps/actions/workflows/codeql-analysis-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/codeql-analysis-workflow.yml)
- [Azure Resource Manager (ARM) Template Tool Kit (TTK)](.github/workflows/arm-ttk-workflow.yml) (NOT WORKING)
    - [![ARM TTK](https://github.com/AErmie/DevSecOps/actions/workflows/arm-ttk-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/arm-ttk-workflow.yml)
- [Codacy](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/codacy-workflow.yml) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/06a8a105132643e0ad4073eec9b85fbd)](https://www.codacy.com/gh/AErmie/DevSecOps/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=AErmie/DevSecOps&amp;utm_campaign=Badge_Grade)

### Data Pipelines

- PENDING EXAMPLES/SAMPLE CODE

### Infrastructure Pipelines

- [Accurics TerraScan](.github/workflows/accurics-terrascan-workflow.yml) [![Accurics TerraScan](https://github.com/AErmie/DevSecOps/actions/workflows/accurics-terrascan-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/accurics-terrascan-workflow.yml)
- [Checkmarx KICS](.github/workflows/iac-kicks.yml) [![Checkmarx KICS](https://github.com/AErmie/DevSecOps/actions/workflows/checkmarx-iackics-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/checkmarx-iackics-workflow.yml)
- [Bridgecrew Checkov](.github/workflows/bridgecrew-checkov-workflow.yml) [![BridgeCrew Checkov](https://github.com/AErmie/DevSecOps/actions/workflows/bridgecrew-checkov-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/bridgecrew-checkov-workflow.yml)
- [GitHub Super-Linter](.github/workflows/github-superlinter.yml)
- [TFLint](.github/workflows/terraform-tflint-workflow.yml) [![TFLint](https://github.com/AErmie/DevSecOps/actions/workflows/terraform-tflint-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/terraform-tflint-workflow.yml)
- [TFSec](.github/workflows/terraform-tfsec-workflow.yml) [![TFSec](https://github.com/AErmie/DevSecOps/actions/workflows/terraform-tfsec-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/terraform-tfsec-workflow.yml)

### Security Pipelines

- [Anchore](.github/workflows/anchore-workflow.yml) [![Anchore Container Image Scan](https://github.com/AErmie/DevSecOps/actions/workflows/anchore-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/anchore-workflow.yml)
- [AquaSec Trivy](.github/workflows/aquasec-trivy-workflow.yml) [![AquaSec Trivy Container Image Scan](https://github.com/AErmie/DevSecOps/actions/workflows/aquasec-trivy-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/aquasec-trivy-workflow.yml)
- [ShiftLeftScan](.github/workflows/shiftleftscan.yml) [![ShiftLeftSecurity Scan](https://github.com/AErmie/DevSecOps/actions/workflows/shiftleftscan-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/shiftleftscan-workflow.yml)
- [TruffleHog](.github/workflows/truffle-hog-workflow.yml) [![TruffleHog Secrets Scan](https://github.com/AErmie/DevSecOps/actions/workflows/truffle-hog-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/truffle-hog-workflow.yml)
- [YELP Detect-Secrets](.github/workflows/yelp-secret-scan.yml) [![YELP Detect-Secrets](https://github.com/AErmie/DevSecOps/actions/workflows/yelp-detectsecret-workflow.yml/badge.svg?branch=main)](https://github.com/AErmie/DevSecOps/actions/workflows/yelp-detectsecret-workflow.yml)
