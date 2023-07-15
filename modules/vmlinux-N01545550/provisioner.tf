resource "null_resource" "provisioner" {
  for_each   = var.vm_linux_name
  depends_on = [azurerm_linux_virtual_machine.linux_machine]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.adminusername
      private_key = file(var.pvt_key)
      host        = azurerm_public_ip.public_ip[each.key].fqdn
    }

  }
}