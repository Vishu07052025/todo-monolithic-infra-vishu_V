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
}
