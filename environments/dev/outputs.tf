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

output "network_security_groups" {
  value       = module.network_security_group
  description = "Network security groups created"
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
