output "Hub-ExpressRoute-Peering-ID" {
  value = azurerm_express_route_circuit_peering.Hub-ExpressRoute-Peering.id
}
output "Hub-ExpressRoute-Peering-ASN" {
  value = azurerm_express_route_circuit_peering.Hub-ExpressRoute-Peering.azure_asn
}
output "Hub-ExpressRoute-Peering-PrimaryPort" {
  value = azurerm_express_route_circuit_peering.Hub-ExpressRoute-Peering.primary_azure_port
}
output "Hub-ExpressRoute-Peering-SecondaryPort" {
  value = azurerm_express_route_circuit_peering.Hub-ExpressRoute-Peering.secondary_azure_port
}