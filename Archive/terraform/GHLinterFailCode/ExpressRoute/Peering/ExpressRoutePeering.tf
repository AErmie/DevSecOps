resource "azurerm_express_route_circuit_peering" "Hub-ExpressRoute-Peering" {
  peering_type                  = var.ExpressRoute-PeeringType
  express_route_circuit_name    = var.ExpressRoute-CircuitName
  resource_group_name           = var.ExpressRoute-RGName
  peer_asn                      = var.PeerASN
  primary_peer_address_prefix   = var.PrimaryPeerAddressPrefix
  secondary_peer_address_prefix = var.SecondaryPeerAddressPrefix
  vlan_id                       = var.VLANID
}