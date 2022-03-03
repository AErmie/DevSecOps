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
  //     name = "HA-DR-Infrastructure-Examples-ExpressRoute-Connection"
  //   }
  // }
}

module "ER-Connection" {
  source      = "../../../ExpressRoute/Connection"
  Environment = "Global"
  CostCenter  = "0987654321"

  HubExpressRoute-PeeringLocation = var.HubExpressRoute-PeeringLocation
  ConnectionType                  = var.ConnectionType
  RouteWeight                     = var.RouteWeight
  EnableBGP                       = var.EnableBGP
  ExpressRoute-GatewayBypass      = var.ExpressRoute-GatewayBypass
  UsePolicyBasedTrafficSelectors  = var.UsePolicyBasedTrafficSelectors

  Hub-ExpressRouteCircuit-Name    = data.azurerm_express_route_circuit.HubExpressRoute.name
  Hub-ExpressRouteCircuit-RGName  = data.azurerm_express_route_circuit.HubExpressRoute.resource_group_name
  Hub-ERGateway-Name              = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.name
  HubExpressRoute-GatewayLocation = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.location
  Hub-ERGateway-RGName            = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.resource_group_name

  HubExpressRoute-GatewayID      = data.azurerm_virtual_network_gateway.HubExpressRoute-Gateway.id
  HubExpressRoute-ExpressRouteID = data.azurerm_express_route_circuit.HubExpressRoute.id
}
