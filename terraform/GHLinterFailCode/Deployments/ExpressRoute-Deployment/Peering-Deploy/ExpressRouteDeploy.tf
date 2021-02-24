provider "azurerm" {
  # alias = "ShdSvc"
  version = ">= 2.0.0"
  features {}
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
  //     name = "HA-DR-Infrastructure-Examples-ExpressRoute-Peering"
  //   }
  // }
}

module "ER-Peering" {
  source                     = "../../../ExpressRoute/Peering"
  ExpressRoute-PeeringType   = var.ExpressRoute-PeeringType
  ExpressRoute-CircuitName   = data.azurerm_express_route_circuit.HubExpressRoute.name
  ExpressRoute-RGName        = data.azurerm_express_route_circuit.HubExpressRoute.resource_group_name
  PeerASN                    = var.PeerASN
  PrimaryPeerAddressPrefix   = var.PrimaryPeerAddressPrefix
  SecondaryPeerAddressPrefix = var.SecondaryPeerAddressPrefix
  VLANID                     = var.VLANID
}