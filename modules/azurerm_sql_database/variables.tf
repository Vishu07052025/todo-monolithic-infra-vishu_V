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
}
