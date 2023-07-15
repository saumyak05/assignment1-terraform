resource "azurerm_managed_disk" "linux_disk" {
  location             = var.loc
  resource_group_name  = var.res_grp_name
  count                = length(var.linux_machine_name)
  name                 = "${var.linux_machine_name[count.index]}-disk"
  create_option        = var.linux_disk_chars.create_option
  storage_account_type = var.linux_disk_chars.storage_account_type
  disk_size_gb         = var.linux_disk_chars.disk_size_gb
  zone                 = tostring(count.index + 1)
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach_linux_disk" {
  count              = length(var.linux_machine_name)
  virtual_machine_id = var.linux_machine_id[count.index]
  managed_disk_id    = azurerm_managed_disk.linux_disk[count.index].id
  caching            = var.linux_disk_chars.caching
  lun                = 0
  depends_on         = [azurerm_managed_disk.linux_disk]
}

resource "azurerm_managed_disk" "windows_disk" {
  location             = var.loc
  resource_group_name  = var.res_grp_name
  count                = length(var.win_machine_name)
  disk_size_gb         = var.win_disk_chars.disk_size_gb
  create_option        = var.win_disk_chars.create_option
  storage_account_type = var.win_disk_chars.storage_account_type
  name                 = "${var.win_machine_name[count.index]}-datadisk"
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "windisk_attach" {
  count              = length(var.win_machine_name)
  managed_disk_id    = azurerm_managed_disk.windows_disk[count.index].id
  virtual_machine_id = var.win_machine_id[count.index]
  caching            = var.win_disk_chars.caching
  lun                = 0
  depends_on         = [azurerm_managed_disk.windows_disk]
}
