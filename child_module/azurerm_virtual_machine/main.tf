variable "VMs" {}

resource "azurerm_network_interface" "NICs" {
  for_each = var.VMs
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.SNETs[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "VMs" {
    for_each = var.VMs
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password = "Azurerm@2026"
  network_interface_ids = [
    azurerm_network_interface.NICs[each.key].id,
  ]
    disable_password_authentication = "false"

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