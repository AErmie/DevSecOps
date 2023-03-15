data "azurerm_virtual_network_gateway" "HubExpressRoute-Gateway" {
  name                = "Hub-ERGW"
  resource_group_name = "SharedServicesRG"
}

data "azurerm_express_route_circuit" "HubExpressRoute" {
  name                = "Hub-ExpressRouteCircuit-${var.HubExpressRoute-PeeringLocation}"
  resource_group_name = "SharedServicesRG"
}