variable "vms" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_id              = string
    tags                = optional(map(string))
  }))
  description = "Map of virtual machines to create"
}
