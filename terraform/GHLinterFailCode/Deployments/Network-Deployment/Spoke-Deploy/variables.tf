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


variable "Prod-ResourceGroupLocation" {
  type        = string
  description = "The location to deploy the Resource Group."
}

variable "Prod-VNet-AddressSpace" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Prod VNet."
}

variable "Prod-WebSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Web Subnet within the Prod VNet."
}

variable "Prod-AppSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the App Subnet within the Prod VNet."
}

variable "Prod-DataSubnet-AddressPrefix" {
  type        = string
  description = "The address space (ie. 1.2.3.4/56) for the Data Subnet within the Prod VNet."
}