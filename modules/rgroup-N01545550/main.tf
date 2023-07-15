resource "azurerm_resource_group" "resource_group" {
  name     = var.res_grp_name
  location = var.loc
  tags     = local.common_tags
}


