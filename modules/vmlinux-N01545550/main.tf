resource "azurerm_public_ip" "public_ip" {
  for_each            = var.vm_linux_name
  location            = var.loc
  name                = "${each.key}-publicip"
  resource_group_name = var.res_grp_name
  domain_name_label   = each.key
  sku                 = var.publicip_characterstics.sku
  allocation_method   = var.publicip_characterstics.allocation_method
  tags                = local.common_tags
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm_linux_name
  name                = "${each.key}-nic"
  location            = var.loc
  resource_group_name = var.res_grp_name

  ip_configuration {
    name                          = "${each.key}-ip_configuration"
    subnet_id                     = var.sub_id
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [azurerm_public_ip.public_ip]
  tags       = local.common_tags
}

resource "azurerm_linux_virtual_machine" "linux_machine" {
  for_each = var.vm_linux_name
  location = var.loc
  name     = each.key
  resource_group_name   = var.res_grp_name
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  admin_username        = var.adminusername
  size                  = var.vm_size
  zone                  = each.value

  os_disk {
    name                 = "${each.key}-os_disk"
    disk_size_gb         = var.disk_characterstics.size
    storage_account_type = var.disk_characterstics.type
    caching              = var.disk_characterstics.caching
  }
  source_image_reference {
    publisher = var.OS_characterstics.publisher
    offer     = var.OS_characterstics.offer
    version   = var.OS_characterstics.version
    sku       = var.OS_characterstics.sku
  }

  boot_diagnostics {
    storage_account_uri = var.storage_endpoint
  }
  admin_ssh_key {
    public_key = file(var.pub_key)
    username   = var.adminusername
  }
  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "ext1" {
  for_each = var.vm_linux_name
  name     = var.extension_1.type

  virtual_machine_id         = azurerm_linux_virtual_machine.linux_machine[each.key].id
  publisher                  = var.extension_1.publisher
  type                       = var.extension_1.type
  type_handler_version       = var.extension_1.type_handler_version
  auto_upgrade_minor_version = var.extension_1.auto_upgrade_minor_version
  depends_on = [
    null_resource.provisioner,
    azurerm_linux_virtual_machine.linux_machine
  ]
  tags = local.common_tags
}

resource "azurerm_virtual_machine_extension" "ext2" {
  for_each = var.vm_linux_name
  name     = var.extension_2.type

  virtual_machine_id         = azurerm_linux_virtual_machine.linux_machine[each.key].id
  publisher                  = var.extension_2.publisher
  type                       = var.extension_2.type
  type_handler_version       = var.extension_2.type_handler_version
  auto_upgrade_minor_version = var.extension_2.auto_upgrade_minor_version
  depends_on = [
    azurerm_linux_virtual_machine.linux_machine,
    null_resource.provisioner,
  ]
  tags = local.common_tags
}


