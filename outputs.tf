output "vm_ip_addresses" {
  description = "The IP addresses of the created VMs"
  value = [
    for vm in proxmox_vm_qemu.test_server : 
    replace(split(",", vm.ipconfig0)[0], "ip=", "")
  ]
}

# Alternatively, if you want to show it as a single IP string for the first VM:
output "vm_ip_address_single" {
  description = "The IP address of the first created VM"
  value = replace(split(",", proxmox_vm_qemu.test_server[0].ipconfig0)[0], "ip=", "")
}
