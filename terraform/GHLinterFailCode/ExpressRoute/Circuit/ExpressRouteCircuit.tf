resource "azurerm_express_route_circuit" "HubExpressRoute" {
  name                  = "Hub-ExpressRouteCircuit-${var.HubExpressRoute-PeeringLocation}"
  resource_group_name   = var.HubExpressRoute-RGName
  location              = var.HubExpressRoute-Location
  service_provider_name = var.HubExpressRoute-ServiceProviderName
  peering_location      = var.HubExpressRoute-PeeringLocation
  bandwidth_in_mbps     = var.HubExpressRoute-BandwidthInMBPS
  sku {
    tier   = var.HubExpressRoute-Tier
    family = var.HubExpressRoute-Family
  }
  allow_classic_operations = var.HubExpressRoute-AllowClassicOperations
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}