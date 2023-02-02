# Initialises Terraform providers and sets their version numbers.

terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.41.0"
        }
    }
}

# Configures the Microsoft Azure provider.
provider "azurerm" {
    features {}  
}