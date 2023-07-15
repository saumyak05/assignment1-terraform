output "linux_machine_name" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].name
}
output "linux_pvt_ip" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].private_ip_address
}
output "linux_machine_ipconfig" {
  value = flatten(values(azurerm_network_interface.nic)[*].ip_configuration[*].name)
}
output "linux_fqdn" {
  value = values(azurerm_public_ip.public_ip)[*].fqdn
}
output "linux_machine_id" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].id
}
output "linux_pub_ip" {
  value = values(azurerm_linux_virtual_machine.linux_machine)[*].public_ip_address
}
output "linux_machine_nic_id" {
  value = values(azurerm_network_interface.nic)[*].id
}

