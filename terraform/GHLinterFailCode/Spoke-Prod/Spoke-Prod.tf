resource "azurerm_resource_group" "Spoke-Prod-RG" {
  name     = "ProdSpokeRG-ADO"
  location = var.Prod-ResourceGroupLocation
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}

resource "azurerm_virtual_network" "Prod-VNET" {
  name                = "Prod-VNET"
  location            = azurerm_resource_group.Spoke-Prod-RG.location
  resource_group_name = azurerm_resource_group.Spoke-Prod-RG.name
  address_space       = [var.Prod-VNet-AddressSpace]
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}

resource "azurerm_subnet" "WebSubnet" {
  name                      = "WebSubnet"
  address_prefix            = var.Prod-WebSubnet-AddressPrefix
  resource_group_name       = azurerm_virtual_network.Prod-VNET.resource_group_name
  virtual_network_name      = azurerm_virtual_network.Prod-VNET.name
}
resource "azurerm_subnet" "AppSubnet" {
  name                      = "AppSubnet"
  address_prefix            = var.Prod-AppSubnet-AddressPrefix
  resource_group_name       = azurerm_virtual_network.Prod-VNET.resource_group_name
  virtual_network_name      = azurerm_virtual_network.Prod-VNET.name
}
resource "azurerm_subnet" "DataSubnet" {
  name                      = "DataSubnet"
  address_prefix            = var.Prod-DataSubnet-AddressPrefix
  resource_group_name       = azurerm_virtual_network.Prod-VNET.resource_group_name
  virtual_network_name      = azurerm_virtual_network.Prod-VNET.name
}

resource "azurerm_subnet_network_security_group_association" "WebSubnet-NSGAssociation" {
  subnet_id                 = azurerm_subnet.WebSubnet.id
  network_security_group_id = azurerm_network_security_group.WebSubnet-NSG.id
}
resource "azurerm_subnet_network_security_group_association" "AppSubnet-NSGAssociation" {
  subnet_id                 = azurerm_subnet.AppSubnet.id
  network_security_group_id = azurerm_network_security_group.AppSubnet-NSG.id
}
resource "azurerm_subnet_network_security_group_association" "DataSubnet-NSGAssociation" {
  subnet_id                 = azurerm_subnet.DataSubnet.id
  network_security_group_id = azurerm_network_security_group.DataSubnet-NSG.id
}