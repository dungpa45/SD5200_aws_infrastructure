resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = var.name
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
    }

    tags = {
        environment = "dev"
        user = "dungpa"
    }
}