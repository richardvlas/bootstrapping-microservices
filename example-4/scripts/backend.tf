# Sets the "backend" used to store Terraform state.
# This is required to make continous delivery work.

terraform {
    backend "azurerm" {
        resource_group_name  = "flixtube-rvl-terraform"
        storage_account_name = "flixtubervlterraform"
        container_name       = "terraform-rvl-state"
        key                  = "terraform.tfstate"
    }
}