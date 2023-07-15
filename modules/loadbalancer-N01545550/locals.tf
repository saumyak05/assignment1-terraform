locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "saumya.kohli"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
  lb_inbound_traffic = {
    http = {
      name                       = "http"
      frontend_port              = 80
      backend_port               = 80
      destination_address_prefix = "*"
      protocol                   = "Tcp"
    }
  }
  lb_healthprobe = {
    http = {
      port = 80
      name = "lb-healthcheck-probe"
    }
  }
}