variable "res_grp_name" {}
variable "loc" {}

variable "database_name" {}
variable "db_chars" {
  type = map(any)
  default = {
    collation = "English_United States.1252"
    charset   = "UTF8"
  }
}

variable "database_server_name" {}
variable "db_server_chars" {
  type = map(any)
  default = {
    sku_name                     = "B_Gen5_1"
    storage_mb                   = 6144
    backup_retention_days        = 8
    administrator_login          = "admin123"
    administrator_login_password = "N01545550@humber"
    version                      = "11"
    ssl_enforcement_enabled      = true
    geo_redundant_backup_enabled = false
    auto_grow_enabled            = false
  }
}