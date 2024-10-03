provider "azurerm" {
  features {}
  subscription_id = var.azure_id
}

# Crear el grupo de recursos
resource "azurerm_resource_group" "tfvm" {
  name     = var.name_vm
  location = var.location
}

# Llamar al módulo de networking
module "networking" {
  source = "./modules/networking"

  vnet_name              = "firstVN-network"
  address_space          = ["10.0.0.0/16"]
  location               = var.location
  resource_group_name    = azurerm_resource_group.tfvm.name
  subnet1_name           = "internal"
  subnet1_address_prefix = "10.0.1.0/24"
  subnet2_name           = "internal2"
  subnet2_address_prefix = "10.0.0.0/24"
  nsg_name               = "vm-nsg"
  public_ip_name         = "vm-public-ip"
  nic_name               = "firstNic"
}

# Crear la máquina virtual
resource "azurerm_linux_virtual_machine" "vmtf" {
  name                = "vmtf-machine"
  resource_group_name = azurerm_resource_group.tfvm.name
  location            = azurerm_resource_group.tfvm.location
  size                = "Standard_F2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  disable_password_authentication = false

  # Usar el output del módulo para referenciar la interfaz de red
  network_interface_ids = [
    module.networking.network_interface_id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}