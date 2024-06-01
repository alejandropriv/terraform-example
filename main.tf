# UUID
resource "random_uuid" "kube_resource_uuid" {}

module "infrastructure_rg" {
  source   = "./resource_group_management"
  
  for_each = var.cluster_rg_config
  location = var.resource_location
  name     = "${local.resource_name_prefix}_${each.value.name}"

}


# Virtual Network
resource "azurerm_virtual_network" "kube_vnet" {
  name                = "${local.resource_name_prefix}_kube_vnet"
  address_space       = var.address_space
  location            = module.infrastructure_rg["network_rg"].location
  resource_group_name = module.infrastructure_rg["network_rg"].name
}


locals {
  resource_name_prefix = "${random_uuid.kube_resource_uuid.result}_${var.stage}"
  
  # How to create an map(object) using a for
  cluster_rg = {
    for k, v in var.cluster_rg_config :

    "${k}" => {
      "name" = "${local.resource_name_prefix}_${k}"
    }
}
