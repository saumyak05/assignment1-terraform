variable "publicip_characterstics" {
  type = map(any)
  default = {
    sku               = "Standard"
    allocation_method = "Static"
  }
}
variable "OS_characterstics" {
  type = map(any)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}
variable "pub_key" {
  default = "~/.ssh/id_rsa.pub"
}
variable "pvt_key" {
  default = "~/.ssh/id_rsa"
}
variable "vm_size" {
  default = "Standard_B1ms"
}

variable "vm_linux_name" {
  type = map(any)
  default = {
    n01545550-l-vm1 = "1"
    n01545550-l-vm2 = "2"
    n01545550-l-vm3 = "3"
  }
}

variable "extension_1" {
  type = map(any)
  default = {
    publisher                  = "Microsoft.Azure.NetworkWatcher"
    auto_upgrade_minor_version = "true"
    type_handler_version       = "1.0"
    type                       = "NetworkWatcherAgentLinux"
  }
}

variable "extension_2" {
  type = map(any)
  default = {
    publisher                  = "Microsoft.Azure.Monitor"
    type_handler_version       = "1.0"
    type                       = "AzureMonitorLinuxAgent"
    auto_upgrade_minor_version = "true"
  }
}
variable "disk_characterstics" {
  type = map(any)
  default = {
    type    = "Standard_LRS"
    size    = 32
    caching = "ReadWrite"
  }
}
variable "adminusername" {
  default = "N01545550"
}
variable "res_grp_name" {}
variable "loc" {}
variable "sub_id" {}
variable "storage_endpoint" {}
