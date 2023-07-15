resource "azurerm_public_ip" "lb_pub_ip" {
  resource_group_name = var.res_grp_name
  location            = var.loc
  name                = var.pub_ip
  domain_name_label   = var.pub_ip
  allocation_method   = var.lb_pub_ip_chars.allocation_method
  sku                 = var.lb_pub_ip_chars.sku
  tags                = local.common_tags
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.loc
  resource_group_name = var.res_grp_name
  sku                 = var.lb_sku
  frontend_ip_configuration {
    name                 = "public-ip"
    public_ip_address_id = azurerm_public_ip.lb_pub_ip.id
  }
  tags = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "lb-pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_pool_association" {
  count                   = length(var.linux_machine_nic_id)
  ip_configuration_name   = var.linux_machine_ipconfig[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-pool.id
  network_interface_id    = var.linux_machine_nic_id[count.index]
}