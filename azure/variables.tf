variable "resource_group_name" {
    type = string
}
variable "resource_group_location" {
    type = string
}
variable "acr_name" {
    type = string
}
variable "aks_name" {
    type = string
}
variable "aks_node_size" {
    type = string
}

variable "aks_node_count" {
    type = number
}
variable "aks_node_min" {
    type = number
}
variable "aks_node_max" {
    type = number
}
variable "vnet_name" {
    type = string
}

