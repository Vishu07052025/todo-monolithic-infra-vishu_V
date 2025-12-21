output "key_vault_ids" {
  value = {
    for k, kv in azurerm_key_vault.keyvault : k => kv.id
  }
  description = "Map of Key Vault IDs"
}

output "key_vault_uris" {
  value = {
    for k, kv in azurerm_key_vault.keyvault : k => kv.vault_uri
  }
  description = "Map of Key Vault URIs"
}
