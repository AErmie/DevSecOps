variable "Environment" {
  type        = string
  description = "Environment tag."
}
variable "CostCenter" {
  type        = string
  description = "CostCenter tag."
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