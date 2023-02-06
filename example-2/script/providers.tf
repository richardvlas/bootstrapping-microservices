# Initialises Terraform providers and sets their version numbers.

terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=3.41.0"
        }
        kubernetes = {
            source  = "hashicorp/kubernetes"
            version = "~>2.3.2"
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