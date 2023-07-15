resource "azurerm_virtual_network" "virtual_network1" {
  name                = var.net1_name
  location            = var.loc
  resource_group_name = var.res_grp_name
  address_space       = var.net1_space
  tags                = local.common_tags

}

resource "azurerm_subnet" "subnet1" {
  name                 = var.sub1
  resource_group_name  = azurerm_virtual_network.virtual_network1.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network1.name
  address_prefixes     = var.sub1_space
}

resource "azurerm_network_security_group" "nsg1" {
  name                = var.nsg1
  location            = azurerm_virtual_network.virtual_network1.location
  resource_group_name = azurerm_virtual_network.virtual_network1.resource_group_name
  tags                = local.common_tags

}

resource "azurerm_network_security_rule" "security_rules" {
  for_each                    = local.network_inbound_rules
  name                        = each.key
  direction                   = each.value.direction
  protocol                    = each.value.protocol
  priority                    = each.value.priority
  destination_address_prefix  = each.value.destination_address_prefix
  source_address_prefix       = each.value.source_address_prefix
  access                      = each.value.access
  destination_port_range      = each.value.destination_port_range
  source_port_range           = each.value.source_port_range
  network_security_group_name = azurerm_network_security_group.nsg1.name
  resource_group_name         = azurerm_virtual_network.virtual_network1.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "sg_ass1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}
