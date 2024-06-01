# RESOURCES
variable "cluster_rg_config" {
  type = map(object({
    name = string
  }))
  description = "Root - resource groups - config"
}

variable "stage" {
  type        = string
  description = "Root - Cluster Stage"
}

variable "resource_location" {
  type        = string
  description = "Root - Location of the resource group."
}

variable "address_space" {
  type        = list(any)
  description = "Root - VNet adress spaces"
}
