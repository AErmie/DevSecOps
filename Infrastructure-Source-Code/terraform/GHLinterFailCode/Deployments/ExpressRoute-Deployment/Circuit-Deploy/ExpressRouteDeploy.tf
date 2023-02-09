provider "azurerm" {
  # alias = "ShdSvc"
  version = ">=1.38.0"
  //   subscription_id = ""
  #(Optional) The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable.

  //   client_id = ""
  #(Optional) The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable.
  //   client_secret = ""
  //   tenant_id     = ""
  #(Optional) The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable.

  environment = "public"
  #(Optional) The Cloud Environment which should be used. Possible values are public, usgovernment, german and china. Defaults to public. This can also be sourced from the ARM_ENVIRONMENT environment variable.
}

# Allows what version of Terraform to use.
terraform {
  required_version = ">=0.12.0"
  # Backend for configuring remote state files to Azure Storage
  // backend "remote" {
  //   organization = "AdinErmie"
  //   workspaces {
  //     name = "HA-DR-Infrastructure-Examples-ExpressRoute-Circuit"
  //   }
  // }
}

module "ER-Circuit" {
  source      = "../../../ExpressRoute/Circuit"
  Environment = "Global"
  CostCenter  = "0987654321"

  HubExpressRoute-RGName                 = var.HubExpressRoute-RGName
  HubExpressRoute-Location               = var.HubExpressRoute-Location
  HubExpressRoute-ServiceProviderName    = var.HubExpressRoute-ServiceProviderName
  HubExpressRoute-PeeringLocation        = var.HubExpressRoute-PeeringLocation
  HubExpressRoute-BandwidthInMBPS        = var.HubExpressRoute-BandwidthInMBPS
  HubExpressRoute-Tier                   = var.HubExpressRoute-Tier
  HubExpressRoute-Family                 = var.HubExpressRoute-Family
  HubExpressRoute-AllowClassicOperations = var.HubExpressRoute-AllowClassicOperations
}
