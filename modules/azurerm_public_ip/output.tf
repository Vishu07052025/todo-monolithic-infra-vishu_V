output "public_ip_ids" {
  value = {
    for k, v in azurerm_public_ip.public_ip : k => v.id
  }
}

output "public_ip_addresses" {
  value = {
    for k, pip in azurerm_public_ip.public_ip : k => pip.ip_address
  }
}
