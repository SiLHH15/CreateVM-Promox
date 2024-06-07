terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://promox01.local:8006/api2/json"
  pm_api_token_id = "terraform_user@pve!auto"
  pm_api_token_secret = "4a20eca6-d80c-4f21-8a42-f7ceb1cc2714"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "test_server" {
  count = 3
  name = "Ubuntu-0${count.index + 1}"
  target_node = var.proxmox_host
  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "50G"
    type = "scsi"
    storage = "local-zfs"
    iothread = 0
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = var.ipconfig0_list[count.index]

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

