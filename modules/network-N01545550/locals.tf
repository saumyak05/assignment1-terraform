locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "saumya.kohli"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }

  network_inbound_rules = {
    http_rule = {
      name                       = "http"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      priority                   = 230
      destination_port_range     = "80"
      source_port_range          = "*"
      destination_address_prefix = "*"
      source_address_prefix      = "*"
      access                     = "Allow"
    }
    ssh_rule = {
      name                       = "ssh"
      direction                  = "Inbound"
      priority                   = 210
      protocol                   = "Tcp"
      destination_port_range     = "22"
      source_port_range          = "*"
      destination_address_prefix = "*"
      source_address_prefix      = "*"
      access                     = "Allow"
    }
    windows_access_rule = {
      name                       = "winrm"
      priority                   = 240
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5985"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    rdp_rule = {
      name                       = "rdp"
      direction                  = "Inbound"
      priority                   = 220
      protocol                   = "Tcp"
      destination_port_range     = "3389"
      source_port_range          = "*"
      destination_address_prefix = "*"
      source_address_prefix      = "*"
      access                     = "Allow"
    }

  }
}