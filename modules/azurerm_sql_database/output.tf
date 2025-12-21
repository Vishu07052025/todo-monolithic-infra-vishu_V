output "sql_database_ids" {
  value = {
    for k, db in azurerm_mssql_database.sql_database : k => db.id
  }
  description = "Map of SQL Database IDs"
}
