variable "loc" {}
variable "pub_ip" {}
variable "res_grp_name" {}
variable "lb_name" {}
variable "pool_name" {}
variable "linux_machine_nic_id" {}
variable "linux_machine_ipconfig" {}

variable "lb_sku" {
  default = "Standard"
}

variable "lb_pub_ip_chars" {
  type = map(any)
  default = {
    allocation_method = "Static"
    sku               = "Standard"
  }
}