resource "azurerm_resource_group" "SharedServicesRG" {
  name     = "SharedServicesRG-ADO"
  location = var.SharedServicesResourceGroupLocation
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}

resource "azurerm_virtual_network" "SharedServicesVNET" {
  name                = "SharedServicesVNET"
  location            = azurerm_resource_group.SharedServicesRG.location
  resource_group_name = azurerm_resource_group.SharedServicesRG.name
  address_space       = [var.SharedServices-VNet-AddressSpace]
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}

resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  address_prefix       = var.SharedServices-GatewaySubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.SharedServicesVNET.name
}

resource "azurerm_subnet" "AzureFirewallSubnet" {
  name                 = "AzureFirewallSubnet"
  address_prefix       = var.SharedServices-AzureFirewallSubnet-AddressPrefix
  resource_group_name  = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name = azurerm_virtual_network.SharedServicesVNET.name
}

resource "azurerm_subnet" "DomainControllerSubnet" {
  name                      = "DomainControllerSubnet"
  address_prefix            = var.SharedServices-DomainControllerSubnet-AddressPrefix
  resource_group_name       = azurerm_virtual_network.SharedServicesVNET.resource_group_name
  virtual_network_name      = azurerm_virtual_network.SharedServicesVNET.name
}

resource "azurerm_subnet_network_security_group_association" "DomainController-NSGAssociation" {
  subnet_id                 = azurerm_subnet.DomainControllerSubnet.id
  network_security_group_id = azurerm_network_security_group.DomainControllerSubnetNSG.id
}