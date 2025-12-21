output "sql_servers" {
  value       = azurerm_mssql_server.sql_server
  description = "Map of SQL Server resources"
}

output "sql_server_ids" {
  value = {
    for k, server in azurerm_mssql_server.sql_server : k => server.id
  }
  description = "Map of SQL Server IDs"
}

output "sql_server_fqdn" {
  value = {
    for k, server in azurerm_mssql_server.sql_server : k => server.fully_qualified_domain_name
  }
  description = "Map of SQL Server FQDNs"
}
