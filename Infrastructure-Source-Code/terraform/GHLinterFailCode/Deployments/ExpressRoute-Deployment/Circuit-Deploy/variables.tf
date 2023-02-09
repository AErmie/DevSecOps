variable "HubExpressRoute-RGName" {
  type        = string
  description = "This is the Resource Group name containing the ExpressRoute resources."
}

variable "HubExpressRoute-Location" {
  type        = string
  description = "The Azure location the deployment is going to (i.e. Canada Central)"
}

variable "HubExpressRoute-ServiceProviderName" {
  type        = string
  description = "The name of the ExpressRoute Service Provider."
}

variable "HubExpressRoute-PeeringLocation" {
  type        = string
  description = "The name of the peering location and not the Azure resource location."
}

variable "HubExpressRoute-BandwidthInMBPS" {
  type        = string
  description = "Express Route circuit speed."
}

variable "HubExpressRoute-Tier" {
  type        = string
  description = "The service tier. Possible values are Standard or Premium."
}

variable "HubExpressRoute-Family" {
  type        = string
  description = "The billing mode for bandwidth. Possible values are MeteredData or UnlimitedData."
}

variable "HubExpressRoute-AllowClassicOperations" {
  type        = string
  description = "Allow the circuit to interact with classic (RDFE) resources. Use this setting if you plan to connect to resources deployed in the classic model."
}
