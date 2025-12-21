variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
  description = "Map of resource groups to create"
}

variable "networks" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })), [])
  }))
  description = "Map of virtual networks to create"
}

variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })), [])
    tags = optional(map(string))
  }))
  description = "Map of network security groups to create"
}

variable "public-ips" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    allocation_method       = string
    sku                     = optional(string, "Standard")
    idle_timeout_in_minutes = optional(number, 4)
    tags                    = optional(map(string))
  }))
  description = "Map of public IPs to create"
}

variable "nics" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    ip_config_name                = string
    private_ip_address_allocation = optional(string, "Dynamic")
    tags                          = optional(map(string))
  }))
  description = "Map of network interfaces to create"
}

variable "nic_public_ip_mapping" {
  type        = map(string)
  description = "Map of NIC names to public IP keys"
}

variable "vms" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    tags                = optional(map(string))
  }))
  description = "Map of virtual machines to create"
}

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
  description = "Map of key vaults to create"
}

variable "sql_servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = optional(string, "12.0")
    administrator_login          = string
    administrator_login_password = string
    tags                         = optional(map(string))
  }))
  description = "Map of SQL servers to create"
}

variable "sql_databases" {
  type = map(object({
    name         = string
    server_id    = string
    collation    = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    license_type = optional(string, "LicenseIncluded")
    max_size_gb  = optional(number, 32)
    sku_name     = optional(string, "Basic")
    tags         = optional(map(string))
  }))
  description = "Map of SQL databases to create"
}
