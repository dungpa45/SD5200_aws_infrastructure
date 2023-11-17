output "aks_id" {
  value = "azurerm_kubernetes_cluster.aks_cluster.id"
}

output "aks_kubelet_identity" {
  value = "azurerm_role_assignment.aks_cluster.principal_id"
}