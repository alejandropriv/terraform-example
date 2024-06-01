output "id" {
  description = "id of the created resource groups"
  value       = azurerm_resource_group.new_resource_group.id
}

output "name" {
  description = "Name of the created resource groups"
  value       = azurerm_resource_group.new_resource_group.name
}

output "location" {
  description = "Location of the created resource groups"
  value       = azurerm_resource_group.new_resource_group.location
}
