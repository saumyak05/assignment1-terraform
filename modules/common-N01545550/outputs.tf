output "vault_name" {
  value = azurerm_recovery_services_vault.recovery_vault.name
}
output "storage_name" {
  value = azurerm_storage_account.storage_account.name
}
output "workspace_name" {
  value = azurerm_log_analytics_workspace.workspace.name
}
output "storage_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}
