output "res_grp_name" {
  value = module.rgroup-N01545550.res_grp_name
}
output "vnet_name" {
  value = module.network-N01545550.vnet1_name
}
output "subnet1_name" {
  value = module.network-N01545550.subnet1_name
}
output "vault_name" {
  value = module.common-N01545550.vault_name
}
output "storage_name" {
  value = module.common-N01545550.storage_name
}
output "workspace_name" {
  value = module.common-N01545550.workspace_name
}
output "linux_machine_name" {
  value = module.vmlinux-N01545550.linux_machine_name
}
output "linux_machine_fqdn" {
  value = module.vmlinux-N01545550.linux_fqdn
}
output "linux_public_ip" {
  value = module.vmlinux-N01545550.linux_pub_ip
}
output "linux_private_ip" {
  value = module.vmlinux-N01545550.linux_pvt_ip
}
output "windows_vm_privateIP" {
  value = module.vmwindows-N01545550.win_pvt_ip
}
output "windows_vm_name" {
  value = module.vmwindows-N01545550.win_machine_name
}
output "windows_vm_publicIP" {
  value = module.vmwindows-N01545550.win_pub_ip
}
output "windows_vm_fqdn" {
  value = module.vmwindows-N01545550.win_fqdn
}
output "linux_disk_name" {
  value = module.datadisk-N01545550.linux_disk_name
}
output "win_disk_name" {
  value = module.datadisk-N01545550.win_disk_name
}

output "loadbalancer_name" {
  value = module.loadbalancer-N01545550.loadbalancer_name
}
output "db_name" {
  value = module.database-N01545550.database_name
}
output "dbserver_name" {
  value     = module.database-N01545550.database_server_name
}

