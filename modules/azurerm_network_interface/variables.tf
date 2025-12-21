variable "nics" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    ip_config_name                = string
    private_ip_address_allocation = optional(string, "Dynamic")
    tags                          = optional(map(string))
  }))
}

variable "subnet_id" {
  type = string
}

variable "public_ip_id" {
  type    = map(string)
  default = {}
}
