# NOTE: Have to create the NSGs first (and in the same TF file as the Subnets, instead of in its own module), 
# due to a bug in the AzureRM Provider (which "should" be fixed in v2.0)
resource "azurerm_network_security_group" "WebSubnet-NSG" {
  name                = "WebSubnet-NSG"
  location            = azurerm_resource_group.Spoke-Prod-RG.location
  resource_group_name = azurerm_resource_group.Spoke-Prod-RG.name
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}
resource "azurerm_network_security_group" "AppSubnet-NSG" {
  name                = "AppSubnet-NSG"
  location            = azurerm_resource_group.Spoke-Prod-RG.location
  resource_group_name = azurerm_resource_group.Spoke-Prod-RG.name
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}
resource "azurerm_network_security_group" "DataSubnet-NSG" {
  name                = "DataSubnet-NSG"
  location            = azurerm_resource_group.Spoke-Prod-RG.location
  resource_group_name = azurerm_resource_group.Spoke-Prod-RG.name
  tags = {
    Environment = var.Environment
    CostCenter  = var.CostCenter
  }
}

resource "azurerm_network_security_rule" "WebSubnet-NSGRule_HTTPS" {
  name                        = "HTTP_InBound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.WebSubnet-NSG.resource_group_name
  network_security_group_name = azurerm_network_security_group.WebSubnet-NSG.name
}
resource "azurerm_network_security_rule" "AppSubnet-NSGRule_HTTPS" {
  name                        = "HTTP_InBound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "443"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.AppSubnet-NSG.resource_group_name
  network_security_group_name = azurerm_network_security_group.AppSubnet-NSG.name
}
resource "azurerm_network_security_rule" "DataSubnet-NSGRule_SQL" {
  name                        = "HTTP_InBound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.DataSubnet-NSG.resource_group_name
  network_security_group_name = azurerm_network_security_group.DataSubnet-NSG.name
}