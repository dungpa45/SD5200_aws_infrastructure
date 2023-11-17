resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = var.aks_name
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name
    dns_prefix          = "myakscluster"

    identity {
      type = "SystemAssigned"
    }
    
    default_node_pool {
        name       = "dungnodepool"
        node_count = var.vm_count
        vm_size    = var.vm_size
        enable_auto_scaling = true
        max_count = var.vm_max
        min_count = var.vm_min
    }

    tags = {
        environment = "dev"
        user = "dungpa"
    }
}

resource "azurerm_container_registry" "acr" {
    name                    = var.acr_name
    location                = var.resource_group_location
    resource_group_name     = var.resource_group_name
    sku                     = "Standard"
    admin_enabled           = true

    tags = {
        environment = "dev"
        user = "dungpa"
    }
}

resource "azurerm_role_assignment" "aks_to_acr" {
    scope                = azurerm_container_registry.acr.id
    role_definition_name = "AcrPull"
    principal_id         = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
    skip_service_principal_aad_check = true
}