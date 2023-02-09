output "SharedServices-RGName" {
  value = azurerm_virtual_network.SharedServicesVNET.*.resource_group_name
}

output "SharedServices-VNet-Name" {
  value = azurerm_virtual_network.SharedServicesVNET.*.name
}

output "SharedServices-VNet-ID" {
  value = azurerm_virtual_network.SharedServicesVNET.*.id
}