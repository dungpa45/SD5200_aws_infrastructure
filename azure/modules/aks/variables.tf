variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "aks_name" {
    type = string
}
variable "acr_name" {
    type = string
}

variable "vm_size" {
    type = string
}
variable "vm_count" {
    type = number
}

variable "vm_min" {
    type = number
}

variable "vm_max" {
    type = number
}

