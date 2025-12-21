variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool, false)
    tenant_id                   = string
    sku_name                    = optional(string, "standard")
    purge_protection_enabled    = optional(bool, false)
    soft_delete_retention_days  = optional(number, 7)
    tags                        = optional(map(string))
  }))
}
