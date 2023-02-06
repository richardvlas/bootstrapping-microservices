# Creates a container registry on Azure so that you can publish your Docker images.

resource "azurerm_container_registry" "container_registry" {
    name                = var.app_name
    resource_group_name = azurerm_resource_group.flixtube.name
    location            = var.location
    sku                 = "Basic"
    admin_enabled       = true
}

output "registry_hostname" {
    value = azurerm_container_registry.container_registry.login_server
}

output "registry_username" {
    value = azurerm_container_registry.container_registry.admin_username
}

output "registry_password" {
    value = azurerm_container_registry.container_registry.admin_password
    sensitive = true
}