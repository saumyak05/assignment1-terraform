variable "res_grp_name" {}
variable "loc" {}
variable "storage_endpoint" {}
variable "win_availabilityset_name" {}
variable "win_machine_name" {}
variable "sub_id" {}
variable "nb_count" {}

variable "win_pubip_chars" {
  type = map(any)
  default = {
    allocation_method = "Static"
    sku               = "Standard"
  }
}
variable "win_os_chars" {
  type = map(any)
  default = {
    sku       = "2016-Datacenter"
    publisher = "MicrosoftWindowsServer"
    version   = "latest"
    offer     = "WindowsServer"
  }
}
variable "win_disk_chars" {
  type = map(any)
  default = {
    caching = "ReadWrite"
    type    = "StandardSSD_LRS"
    size    = 128
  }
}
variable "win_extension_1" {
  type = map(any)
  default = {
    publisher                  = "Microsoft.Azure.Security"
    type                       = "IaaSAntimalware"
    type_handler_version       = "1.3"
    auto_upgrade_minor_version = "true"
  }
}
variable "windows_availabilityset_chars" {
  type = map(any)
  default = {
    platform_fault_domain_count  = "2"
    platform_update_domain_count = "5"
  }
}

variable "win_adminusername" {
  default = "N01545550"
}
variable "win_pvt_ip_adrs_allocation" {
  default = "Dynamic"
}
variable "win_passwd" {
  default = "N01545550@humber"
}
variable "win_machine_size" {
  default = "Standard_B1ms"
}
variable "pvt_key" {
  default = "/Users/saumya/.ssh/id_rsa"
}