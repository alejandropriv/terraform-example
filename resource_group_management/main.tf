# Resource Group
resource "azurerm_resource_group" "new_resource_group" {
  name     = var.name
  location = var.location
}
