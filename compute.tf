resource "azurerm_linux_virtual_machine" "linux_build" {
  name                = "artifactory"
  resource_group_name = azurerm_resource_group.rg-jfrog.name
  location            = azurerm_resource_group.rg-jfrog.location
  size                = "Standard_B2s"
  admin_username      = var.root_user

  network_interface_ids = [
    azurerm_network_interface.vnic.id
  ]

  admin_ssh_key {
    username   = "ubuntu"
    public_key = file("../../.keys/azure-keys/ubz_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = "32"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}