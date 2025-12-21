output "resource_groups" {
  value       = module.resource_group.resource_group_ids
  description = "Map of resource group IDs created"
}

output "virtual_networks" {
  value       = module.network.virtual_network_ids
  description = "Map of virtual network IDs created"
}

output "subnets" {
  value       = module.network.subnet_ids
  description = "Map of subnet IDs created"
}

output "public_ips" {
  value       = module.public_ip.public_ip_addresses
  description = "Map of public IP addresses created"
}

output "network_interfaces" {
  value       = module.network_interface.nics
  description = "Details of network interfaces created"
}

output "virtual_machines" {
  value       = module.compute.vm_ids
  description = "Map of virtual machine IDs created"
}

output "key_vaults" {
  value       = module.key_vault.key_vault_uris
  description = "Map of Key Vault URIs"
}

output "sql_servers" {
  value       = module.sql_server.sql_server_fqdn
  description = "Map of SQL Server FQDNs"
}

output "sql_databases" {
  value       = module.sql_database.sql_database_ids
  description = "Map of SQL Database IDs"
}
