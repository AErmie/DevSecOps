# Allows what version of Terraform to use.
terraform {
  required_version = ">=0.14.0"
  # Backend for configuring remote state files to Azure Storage
  backend "azurerm" {
    # resource_group_name   = "TerraformStateRG"
    # storage_account_name  = "terraformstatesaae"
    # container_name        = "tfstate"
    # key                   = "networking_hub.tfstate"
  }
}

# Configure the Azure Provider
provider "azurerm" {
  # While version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = ">= 2.0.0"
  #(Optional) The Subscription ID which should be used. This can also be sourced from the ARM_SUBSCRIPTION_ID Environment Variable.
  # subscription_id = var.subscription_id
  #(Optional) The Client ID which should be used. This can also be sourced from the ARM_CLIENT_ID Environment Variable.
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  #(Optional) The Tenant ID which should be used. This can also be sourced from the ARM_TENANT_ID Environment Variable.
  # tenant_id       = var.tenant_id
  #(Optional) The Cloud Environment which should be used. Possible values are public, usgovernment, german and china. Defaults to public. This can also be sourced from the ARM_ENVIRONMENT environment variable.
  environment = "public"
  features {}
}

module "vnets-SharedServices" {
  source      = "../../../Hub/"
  Environment = "SharedServices"
  CostCenter  = "12345"

  SharedServicesResourceGroupLocation                 = var.SharedServicesResourceGroupLocation
  SharedServices-VNet-AddressSpace                    = var.SharedServices-VNet-AddressSpace
  SharedServices-GatewaySubnet-AddressPrefix          = var.SharedServices-GatewaySubnet-AddressPrefix
  SharedServices-DomainControllerSubnet-AddressPrefix = var.SharedServices-DomainControllerSubnet-AddressPrefix
  SharedServices-AzureFirewallSubnet-AddressPrefix    = var.SharedServices-AzureFirewallSubnet-AddressPrefix
}