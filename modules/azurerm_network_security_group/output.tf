output "nsg_ids" {
  value = {
    for k, nsg in azurerm_network_security_group.nsgs : k => nsg.id
  }
  description = "Map of NSG resource IDs"
}

output "nsgs" {
  value       = azurerm_network_security_group.nsgs
  description = "Map of NSG resources"
}
