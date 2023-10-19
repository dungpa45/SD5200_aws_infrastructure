terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "3.69.0"
        }
    }
    required_version = ">= 1.1.0"
}

provider "azurerm" {
    skip_provider_registration = "true"
    features {}
}

module "resource_group" {
    source = "./modules/resource_group"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "vnet" {
    source = "./modules/vnet"
    name = var.vnet_name
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
    depends_on = [ module.resource_group ]
}

module "acr" {
    source = "./modules/acr"
    name = var.acr_name
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "aks_cluster" {
    source = "./modules/aks"
    name = var.aks_name
    vm_count = var.aks_node_count
    vm_size = var.aks_node_size
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
    depends_on = [ module.resource_group, module.vnet ]
}