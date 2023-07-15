output "win_disk_name" {
  value = azurerm_managed_disk.windows_disk[*].name
}
output "linux_disk_name" {
  value = azurerm_managed_disk.linux_disk[*].name
}

