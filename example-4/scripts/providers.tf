# Initialises Terraform providers and sets their version numbers.

terraform {
    required_version = ">= 0.12.4"
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>2.0.0"
        }
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "~>2.0.0"
        }

    }
}

# Configures the Microsoft Azure provider.
provider "azurerm" {
    features {}  
}

# Configures the Kubernetes (cluster) provider.
provider "kubernetes" {
    host                   = azurerm_kubernetes_cluster.cluster.kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate)
}