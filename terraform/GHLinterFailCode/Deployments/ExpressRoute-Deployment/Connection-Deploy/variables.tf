variable "HubExpressRoute-PeeringLocation" {
  type        = string
  description = "The name of the peering location and not the Azure resource location."
}

variable "ConnectionType" {
  type        = string
  description = "(Required) The type of connection. Valid options are IPsec (Site-to-Site), ExpressRoute (ExpressRoute), and Vnet2Vnet (VNet-to-VNet). "
}
variable "RouteWeight" {
  type        = string
  description = "(Optional) The routing weight. Defaults to 10. Expected range (1-1000)"
}
variable "EnableBGP" {
  type        = string
  description = "(Optional) If true, BGP (Border Gateway Protocol) is enabled for this connection. Defaults to false."
}
variable "ExpressRoute-GatewayBypass" {
  type        = string
  description = "(Optional) If true, data packets will bypass ExpressRoute Gateway for data forwarding This is only valid for ExpressRoute connections."
}
variable "UsePolicyBasedTrafficSelectors" {
  type        = string
  description = "(Optional) If true, policy-based traffic selectors are enabled for this connection. Enabling policy-based traffic selectors requires an ipsec_policy block. Defaults to false."
}
