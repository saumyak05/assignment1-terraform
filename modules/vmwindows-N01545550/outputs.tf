output "win_machine_name" {
  value = azurerm_windows_virtual_machine.win_machine[*].name
}
output "win_fqdn" {
  value = azurerm_public_ip.win_public_ip[*].fqdn
}
output "win_pvt_ip" {
  value = azurerm_windows_virtual_machine.win_machine[*].private_ip_address
}
output "win_pub_ip" {
  value = azurerm_windows_virtual_machine.win_machine[*].public_ip_address
}
output "win_machine_id" {
  value = azurerm_windows_virtual_machine.win_machine[*].id
}