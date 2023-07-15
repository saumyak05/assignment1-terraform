output "database_server_name" {
  value = azurerm_postgresql_server.database-server.name
}
output "database_name" {
  value = azurerm_postgresql_database.database_details.name
}

