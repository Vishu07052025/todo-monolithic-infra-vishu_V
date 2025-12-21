output "resource_group_ids" {
  value = {
    for k, rg in azurerm_resource_group.rgs : k => rg.id
  }
  description = "Map of resource group IDs"
}
