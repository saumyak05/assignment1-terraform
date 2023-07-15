variable "workspace_name" {}
variable "loc" {}
variable "vault_name" {}
variable "res_grp_name" {}
variable "storage_name" {}
variable "workspace_characterstics" {
  type = map(any)
  default = {
    retention = "30"
    sku       = "PerGB2018"
  }
}
variable "vault_characterstics" {
  type = map(any)
  default = {
    sku = "Standard"
  }
}
variable "storage_characterstics" {
  type = map(any)
  default = {
    replication = "LRS"
    tier        = "Standard"
  }
}
