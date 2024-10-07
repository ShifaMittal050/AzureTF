# ARM provider block -rekhu
provider "azurerm" {
  version = "=3.0.0"
  features {}
}
# Terraform backend configuration block -precreated
terraform {
  backend "azurerm" {
    resource_group_name  = "RG-Test1"
    storage_account_name = "satftest1"
    container_name       = "con-satftest1"
    key                  = "Key1"
  }
}
