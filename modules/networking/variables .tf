variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet1_name" {
  type = string
}

variable "subnet1_address_prefix" {
  type = string
}

variable "subnet2_name" {
  type = string
}

variable "subnet2_address_prefix" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "nic_name" {
  type = string
}
