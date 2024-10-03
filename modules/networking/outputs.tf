# modules/networking/outputs.tf

# Exponer el ID de la interfaz de red
output "network_interface_id" {
  value = azurerm_network_interface.nic.id
}

# Exponer el ID de la IP pública (si lo necesitas)
output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}
