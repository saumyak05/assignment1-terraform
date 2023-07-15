resource "azurerm_public_ip" "win_public_ip" {
  count               = var.nb_count
  resource_group_name = var.res_grp_name
  name                = "${var.win_machine_name}-pip-${format("%1d", count.index + 1)}"
  domain_name_label   = "${var.win_machine_name}${format("%1d", count.index + 1)}"
  location            = var.loc
  sku                 = var.win_pubip_chars.sku
  allocation_method   = var.win_pubip_chars.allocation_method
  tags                = local.common_tags
}

resource "azurerm_network_interface" "win_nic" {
  count               = var.nb_count
  location            = var.loc
  resource_group_name = var.res_grp_name
  name                = "${var.win_machine_name}-nic-${format("%1d", count.index + 1)}"

  ip_configuration {
    name                          = "${var.win_machine_name}-ipconfig-${format("%1d", count.index + 1)}"
    private_ip_address_allocation = var.win_pvt_ip_adrs_allocation
    public_ip_address_id          = element(azurerm_public_ip.win_public_ip[*].id, count.index + 1)
    subnet_id                     = var.sub_id
  }
  depends_on = [azurerm_public_ip.win_public_ip]
  tags       = local.common_tags
}

resource "azurerm_windows_virtual_machine" "win_machine" {
  count                 = var.nb_count
  location              = var.loc
  name                  = "${var.win_machine_name}${format("%1d", count.index + 1)}"
  network_interface_ids = [element(azurerm_network_interface.win_nic[*].id, count.index + 1)]
  resource_group_name   = var.res_grp_name
  size                  = var.win_machine_size
  admin_username        = var.win_adminusername
  admin_password        = var.win_passwd
  availability_set_id   = azurerm_availability_set.win_av_set.id
  depends_on            = [azurerm_availability_set.win_av_set]

  os_disk {
    name                 = "${var.win_machine_name}-os-disk${format("%1d", count.index + 1)}"
    disk_size_gb         = var.win_disk_chars.size
    caching              = var.win_disk_chars.caching
    storage_account_type = var.win_disk_chars.type
  }

  boot_diagnostics {
    storage_account_uri = var.storage_endpoint
  }
  winrm_listener {
    protocol = "Http"
  }
  source_image_reference {
    publisher = var.win_os_chars.publisher
    offer     = var.win_os_chars.offer
    sku       = var.win_os_chars.sku
    version   = var.win_os_chars.version
  }
  tags = local.common_tags
}

resource "azurerm_availability_set" "win_av_set" {
  name                         = var.win_availabilityset_name
  resource_group_name          = var.res_grp_name
  location                     = var.loc
  platform_fault_domain_count  = var.windows_availabilityset_chars.platform_fault_domain_count
  platform_update_domain_count = var.windows_availabilityset_chars.platform_update_domain_count
  tags                         = local.common_tags
}

resource "azurerm_virtual_machine_extension" "win_extension_1" {
  count = var.nb_count
  name  = var.win_extension_1.type

  virtual_machine_id         = element(azurerm_windows_virtual_machine.win_machine[*].id, count.index + 1)
  type                       = var.win_extension_1.type
  auto_upgrade_minor_version = var.win_extension_1.auto_upgrade_minor_version
  publisher                  = var.win_extension_1.publisher
  type_handler_version       = var.win_extension_1.type_handler_version
  tags                       = local.common_tags
  depends_on = [
    azurerm_windows_virtual_machine.win_machine,
  ]
}