resource "azurerm_virtual_network_gateway_connection" "ExpressRouteConnection" {
  name                = "Hub-ExpressRouteCircuit-${var.HubExpressRoute-PeeringLocation}-Connection"
  location            = var.HubExpressRoute-GatewayLocation
  resource_group_name = var.Hub-ERGateway-RGName

  type                               = var.ConnectionType
  routing_weight                     = var.RouteWeight
  enable_bgp                         = var.EnableBGP
  express_route_gateway_bypass       = var.ExpressRoute-GatewayBypass
  use_policy_based_traffic_selectors = var.UsePolicyBasedTrafficSelectors

  virtual_network_gateway_id = var.HubExpressRoute-GatewayID
  express_route_circuit_id   = var.HubExpressRoute-ExpressRouteID
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}