data "azurerm_virtual_network_gateway" "HubExpressRoute-Gateway" {
  name                = "Hub-ERGW"
  resource_group_name = "SharedServicesRG"
}