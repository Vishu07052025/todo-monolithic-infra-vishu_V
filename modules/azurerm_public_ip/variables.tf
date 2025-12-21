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
}
