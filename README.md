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
  - [Unit, Integration, Functional Tests](https://github.com/AErmie/DevSecOps/blob/main/eShopOnWeb-CI.yml)
  - [Build and Publish Docker Container](https://github.com/AErmie/DevSecOps/blob/main/eShopOnWeb-Docker-CI.yml)
  - [Azure Resource Manager (ARM) Template Tool Kit (TTK)](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/arm-ttk-pipeline.yml)
  - [Azure Bicep](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/azure-bicep-pipeline.yml) (INCOMPLETE)
  - [SonarCloud](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/sonar-cloud-pipeline.yml)
  - [WhiteSource](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/whitesource-pipeline.yml)
- DATA
  - PENDING
- INFRA
  - [Accurics TerraScan](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/terraform-terrascan-pipeline.yml)
  - [GitHub Super-Linter](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/terraform-githublinter-pipeline.yml)
  - [Checkmarx KICS](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/iac-kicks-pipeline.yml)
  - [Bridgecrew Checkov](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/terraform-checkov-pipeline.yml)
  - [Terraform-Compliance](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/terraform-tfcompliance-pipeline.yml)
  - [TFLint](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/terraform-tflint.yml)
  - [TFSec](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/terraform-tfsec-pipeline.yml)
- SEC
  - [Anchore](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/anchore-pipeline.yml)
  - [AquaSec Trivy](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/sec-trivy-pipeline.yml)
  - [Microsoft CredScan](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/msft-credscan-pipeline.yml)
  - [OWASP ZAP](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/sec-owasp-pipeline.yml)
  - [Snyk](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/snyk-securityScan-pipeline.yml)
  - [YELP Detect-Secrets](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/sec-secretscan-yelpdetectsecrets.yml)
  - [TruffleHog](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/truffleHog-secretScan-pipeline.yml) (INCOMPLETE)
  - [ShiftLeftScan](https://github.com/AErmie/DevSecOps/blob/main/azure-pipelines/sec-shiftleftscan-pipeline.yml)

## GitHub Actions (GHA) Workflows

The following YAML-based GitHub Actions (GHA) Workflows have been created and tested:

- APP
  - [CodeQL Analysis](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/codeql-analysis.yml)
- DATA
  - PENDING
- INFRA
  - [Accurics TerraScan](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/accurics-terrascan-workflow.yml)
  - [Checkmarx KICS](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/iac-kicks.yml)
  - [Bridgecrew Checkov](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/bridgecrew-checkov-workflow.yml)
  - [GitHub Super-Linter](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/github-superlinter.yml)
  - [TFLint](.github/workflows/terraform-tflint-workflow.yml)
- SEC
  - [ShiftLeftScan](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/shiftleftscan.yml)
  - [YELP Detect-Secrets](https://github.com/AErmie/DevSecOps/blob/main/.github/workflows/yelp-secret-scan.yml)
