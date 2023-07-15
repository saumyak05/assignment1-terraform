resource "azurerm_postgresql_server" "database-server" {
  name                         = var.database_server_name
  location                     = var.loc
  resource_group_name          = var.res_grp_name
  sku_name                     = var.db_server_chars.sku_name
  storage_mb                   = var.db_server_chars.storage_mb
  administrator_login          = var.db_server_chars.administrator_login
  administrator_login_password = var.db_server_chars.administrator_login_password
  ssl_enforcement_enabled      = var.db_server_chars.ssl_enforcement_enabled
  geo_redundant_backup_enabled = var.db_server_chars.geo_redundant_backup_enabled
  version                      = var.db_server_chars.version
  backup_retention_days        = var.db_server_chars.backup_retention_days
  auto_grow_enabled            = var.db_server_chars.auto_grow_enabled
  tags                         = local.common_tags

}

resource "azurerm_postgresql_database" "database_details" {
  name                = var.database_name
  server_name         = azurerm_postgresql_server.database-server.name
  resource_group_name = azurerm_postgresql_server.database-server.resource_group_name
  collation           = var.db_chars.collation
  charset             = var.db_chars.charset
}