resource "azurerm_virtual_network_peering" "Hub-to-Prod-Peering" {
  name                         = "Hub-to-Prod-Peering"
  resource_group_name          = var.HubVNet-RGName
  virtual_network_name         = var.HubVNet-Name
  remote_virtual_network_id    = var.ProdNetwork-ID
  allow_virtual_network_access = var.HubVNet-AllowVNetAccess
  allow_forwarded_traffic      = var.HubVNet-AllowForwardedTraffic
  allow_gateway_transit        = var.HubVNet-AllowGatewayTransit
}

resource "azurerm_virtual_network_peering" "Prod-to-Hub-Peering" {
  name                         = "Prod-to-Hub-Peering"
  resource_group_name          = var.ProdVNet-RGName
  virtual_network_name         = var.ProdVNet-Name
  remote_virtual_network_id    = var.HubNetwork-ID
  allow_virtual_network_access = var.ProdVNet-AllowVNetAccess
  allow_forwarded_traffic      = var.ProdVNet-AllowForwardedTraffic
  allow_gateway_transit        = var.ProdVNet-AllowGatewayTransit
  depends_on                   = [azurerm_virtual_network_peering.Hub-to-Prod-Peering]
}