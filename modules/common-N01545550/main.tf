resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_name
  resource_group_name      = var.res_grp_name
  location                 = var.loc
  account_tier             = var.storage_characterstics.tier
  account_replication_type = var.storage_characterstics.replication
  tags                     = local.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.vault_name
  location            = var.loc
  resource_group_name = var.res_grp_name
  sku                 = var.vault_characterstics.sku
  tags                = local.common_tags
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.workspace_name
  location            = var.loc
  resource_group_name = var.res_grp_name
  sku                 = var.workspace_characterstics.sku
  retention_in_days   = var.workspace_characterstics.retention
  tags                = local.common_tags
}
