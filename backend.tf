terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01545550RG"
    storage_account_name = "tfstaten01545550sa"
    container_name       = "tfstatefiles"
    key                  = "tf_state_assignment"

  }
}