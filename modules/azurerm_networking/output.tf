output "virtual_network_ids" {
  value = {
    for k, vnet in azurerm_virtual_network.virtual_networks : k => vnet.id
  }
}

output "subnet_ids" {
  value = merge([
    for vnet_key, vnet in azurerm_virtual_network.virtual_networks : {
      for s in vnet.subnet :
      "${vnet_key}.${s.name}" => s.id
    }
  ]...)
}
