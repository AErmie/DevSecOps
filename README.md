[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e70d0b70310d4fc3930504b1dc9a7f76)](https://app.codacy.com/gh/AErmie/DevSecOps?utm_source=github.com&utm_medium=referral&utm_content=AErmie/DevSecOps&utm_campaign=Badge_Grade_Settings)
[![GitHub CodeQL](https://github.com/AErmie/DevSecOps/actions/workflows/codeql-analysis-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/codeql-analysis-workflow.yml)

[![ShiftLeftSecurity Scan](https://github.com/AErmie/DevSecOps/actions/workflows/shiftleftscan-workflow.yml/badge.svg)](https://github.com/AErmie/DevSecOps/actions/workflows/shiftleftscan-workflow.yml)

[![YELP Detect-Secrets](https://github.com/AErmie/DevSecOps/actions/workflows/yelp-detectsecret-workflow.yml/badge.svg?branch=main)](https://github.com/AErmie/DevSecOps/actions/workflows/yelp-detectsecret-workflow.yml)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=alert_status)](https://sonarcloud.io/dashboard?id=randomprojectkey)

[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=sqale_rating)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=reliability_rating)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=security_rating)](https://sonarcloud.io/dashboard?id=randomprojectkey)

[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=bugs)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=code_smells)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=coverage)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=duplicated_lines_density)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=ncloc)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=sqale_index)](https://sonarcloud.io/dashboard?id=randomprojectkey)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=randomprojectkey&metric=vulnerabilities)](https://sonarcloud.io/dashboard?id=randomprojectkey)

# DevSecOps

This repo is used for testing DevSecOps practices and toolsets, and is used for demonstration purposes only.

# WARNING

This repo contains code that is purposefully vulnerable and insecure. Use at your own risk!

## Azure DevOps (ADO) Pipelines

The following YAML-based Azure DevOps (ADO) pipelines have been created and tested:

- APP
  - [Unit, Integration, Functional Tests](eShopOnWeb-CI.yml)
  - [Build and Publish Docker Container](eShopOnWeb-Docker-CI.yml)
  - [Azure Resource Manager (ARM) Template Tool Kit (TTK)](azure-pipelines/arm-ttk-pipeline.yml)
  - [Azure Bicep](azure-pipelines/azure-bicep-pipeline.yml) (INCOMPLETE)
  - [SonarCloud](azure-pipelines/sonar-cloud-pipeline.yml)
  - [WhiteSource](azure-pipelines/whitesource-pipeline.yml)
- DATA
  - PENDING
- INFRA
  - [Accurics TerraScan](azure-pipelines/terraform-terrascan-pipeline.yml)
  - [GitHub Super-Linter](azure-pipelines/terraform-githublinter-pipeline.yml)
  - [Checkmarx KICS](azure-pipelines/iac-kicks-pipeline.yml)
  - [Bridgecrew Checkov](azure-pipelines/terraform-checkov-pipeline.yml)
  - [Terraform-Compliance](azure-pipelines/terraform-tfcompliance-pipeline.yml)
  - [TFLint](azure-pipelines/terraform-tflint.yml)
  - [TFSec](azure-pipelines/terraform-tfsec-pipeline.yml)
- SEC
  - [Anchore](azure-pipelines/anchore-pipeline.yml)
  - [AquaSec Trivy](azure-pipelines/sec-trivy-pipeline.yml)
  - [Microsoft CredScan](azure-pipelines/msft-credscan-pipeline.yml)
  - [OWASP ZAP](azure-pipelines/sec-owasp-pipeline.yml)
  - [Snyk](azure-pipelines/snyk-securityScan-pipeline.yml)
  - [YELP Detect-Secrets](azure-pipelines/sec-secretscan-yelpdetectsecrets.yml)
  - [TruffleHog](azure-pipelines/truffleHog-secretScan-pipeline.yml) (INCOMPLETE)
  - [ShiftLeftScan](azure-pipelines/sec-shiftleftscan-pipeline.yml)

## GitHub Actions (GHA) Workflows

The following YAML-based GitHub Actions (GHA) Workflows have been created and tested:

- APP
  - [CodeQL Analysis](.github/workflows/codeql-analysis.yml)
  - [Azure Resource Manager (ARM) Template Tool Kit (TTK)](.github/workflows/arm-ttk-workflow.yml)
- DATA
  - PENDING
- INFRA
  - [Accurics TerraScan](.github/workflows/accurics-terrascan-workflow.yml)
  - [Checkmarx KICS](.github/workflows/iac-kicks.yml)
  - [Bridgecrew Checkov](.github/workflows/bridgecrew-checkov-workflow.yml)
  - [GitHub Super-Linter](.github/workflows/github-superlinter.yml)
  - [TFLint](.github/workflows/terraform-tflint-workflow.yml)
  - [TFSec](.github/workflows/terraform-tfsec-workflow.yml)
- SEC
  - [Anchore](.github/workflows/anchore-workflow.yml)
  - [AquaSec Trivy](.github/workflows/aquasec-trivy-workflow.yml)
  - [ShiftLeftScan](.github/workflows/shiftleftscan.yml)
  - [TruffleHog](.github/workflows/truffle-hog-workflow.yml)
  - [YELP Detect-Secrets](.github/workflows/yelp-secret-scan.yml)
