variable "subscription_id" {
    description = "Subscription ID"
}
variable "client_id" {
    description = "Client ID"
}
variable "client_secret" {
    description = "Client Secret"
}
variable "tenant_id" {
    description = "Tenant ID"
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