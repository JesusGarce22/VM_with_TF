# Nombre de la máquina virtual
variable "name_vm" {
  type        = string
  default     = "jesusfirstvm"
  description = "Nombre de la máquina virtual"
}

# Ubicación de los recursos en Azure
variable "location" {
  type        = string
  default     = "westus"
  description = "Ubicación de los recursos en Azure"
}

# ID de la suscripción de Azure
variable "azure_id" {
  type        = string
  default     = "29a821ef-a0d3-4990-9a7a-98f33b177c32"
  description = "ID de la suscripción de Azure"
}

# Usuario administrador de la máquina virtual
variable "admin_username" {
  type        = string
  default     = "adminuser"
  description = "Nombre de usuario administrador"
}

# Contraseña de la máquina virtual
variable "admin_password" {
  type        = string
  default     = "Password1234!"
  description = "Contraseña de la máquina virtual"
}
