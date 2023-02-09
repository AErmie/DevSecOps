variable "HubVNet-RGName" {
  type        = string
  description = "The Resource Group nane that contains the Hub VNet object (since this is where the Peering object will be created)."
}

variable "HubVNet-Name" {
  type        = string
  description = "The Hub VNet Name (for peering 'from')."
}

variable "HubNetwork-ID" {
  type        = string
  description = "The Prod VNet ID (for peering 'to')."
}

variable "HubVNet-AllowVNetAccess" {
  type        = string
  description = "Enable communication between the two virtual networks."
}

variable "HubVNet-AllowForwardedTraffic" {
  type        = string
  description = "Allow traffic forwarded by a network virtual appliance in a virtual network (that didn't originate from the virtual network) to flow to this virtual network through a peering."
}

variable "HubVNet-AllowGatewayTransit" {
  type        = string
  description = "If you have a virtual network gateway attached to this virtual network and want to allow traffic from the peered virtual network to flow through the gateway. "
}



variable "ProdVNet-RGName" {
  type        = string
  description = "The Resource Group nane that contains the Prod VNet object (since this is where the Peering object will be created)."
}

variable "ProdVNet-Name" {
  type        = string
  description = "The Hub VNet Name (for peering 'from')."
}

variable "ProdNetwork-ID" {
  type        = string
  description = "The Prod VNet ID (for peering 'to')."
}

variable "ProdVNet-AllowVNetAccess" {
  type        = string
  description = "Enable communication between the two virtual networks."
}

variable "ProdVNet-AllowForwardedTraffic" {
  type        = string
  description = "Allow traffic forwarded by a network virtual appliance in a virtual network (that didn't originate from the virtual network) to flow to this virtual network through a peering."
}

variable "ProdVNet-AllowGatewayTransit" {
  type        = string
  description = "If you have a virtual network gateway attached to this virtual network and want to allow traffic from the peered virtual network to flow through the gateway. "
}