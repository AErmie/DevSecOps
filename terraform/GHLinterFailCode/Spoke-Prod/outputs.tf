output "Prod-RGName" {
  value = azurerm_virtual_network.Prod-VNET.resource_group_name
}

output "Prod-VNet-Name" {
  value = azurerm_virtual_network.Prod-VNET.name
}

output "Prod-VNet-ID" {
  value = azurerm_virtual_network.Prod-VNET.id
}