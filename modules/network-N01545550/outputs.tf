output "vnet1_name" {
  value = azurerm_virtual_network.virtual_network1.name
}
output "subnet1_name" {
  value = azurerm_subnet.subnet1.name
}
output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}