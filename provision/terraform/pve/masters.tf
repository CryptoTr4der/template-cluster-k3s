resource "proxmox_vm_qemu" "kube-master" {
  for_each = var.masters

  name        = each.key
  target_node = each.value.target_node
  agent       = 1
  clone       = var.common.clone
  vmid        = each.value.id
  memory      = each.value.memory
  cores       = each.value.cores
  vga {
    type = "qxl"
  }
  network {
    model    = "virtio"
    macaddr  = each.value.macaddr
    bridge   = "vmbr0"
    tag      = 30
    firewall = false
  }
  #network {
  #  model    = "virtio"
  #  bridge   = "vmbr1"
  #}
  disk {
    type    = "scsi"
    storage = each.value.storage
    size    = each.value.disk
    format  = "raw"
    ssd     = 1
    discard = "on"
  }
  serial {
    id = 0
    type = "socket"
  }
  bootdisk     = "scsi0"
  scsihw       = "virtio-scsi-pci"
  os_type      = "cloud-init"
  ipconfig0    = "ip=${each.value.cidr},gw=${each.value.gw}"
  ciuser       = data.sops_file.pve_secrets.data["ci_user"]
  cipassword   = data.sops_file.pve_secrets.data["ci_pass"]
  searchdomain = var.common.search_domain
  nameserver   = var.common.nameserver
  sshkeys      = data.sops_file.pve_secrets.data["ssh_key"]
}
