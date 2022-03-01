
variable "common" {
  type = map(string)
  default = {
    os_type       = "ubuntu"
    clone         = "ubuntu-20.04-cloudimg"
    search_domain = ""
    #search_domain = "home.lo"
    #search_domain = "dfw.56k.sh 56k.sh"
    nameserver    = "10.10.30.100"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    k3s-master-1 = {
      id          = 3011
      cidr        = "10.10.30.11/24"
      cores       = 4
      gw          = "10.10.30.1"
      macaddr     = "02:DE:4D:48:28:01"
      memory      = 8192
      disk        = "40G"
      storage     = "local"
      target_node = "pve2"
    },
    k3s-master-2 = {
      id          = 3012
      cidr        = "10.10.30.12/24"
      cores       = 4
      gw          = "10.10.30.1"
      macaddr     = "02:DE:4D:48:28:02"
      memory      = 8192
      disk        = "40G"
      storage     = "local"
      target_node = "pve2"
    },
    k3s-master-3 = {
      id          = 3013
      cidr        = "10.10.30.13/24"
      cores       = 4
      gw          = "10.10.30.1"
      macaddr     = "02:DE:4D:48:28:03"
      memory      = 8192
      disk        = "40G"
      storage     = "local"
      target_node = "pve2"
    }
  }
}

variable "workers" {
  type = map(map(string))
  default = {
    k3s-worker-1 = {
      id          = 3021
      cidr        = "10.10.30.21/24"
      cores       = 4
      gw          = "10.10.30.1"
      macaddr     = "02:DE:4D:48:28:0A"
      memory      = 8192
      disk        = "40G"
      storage     = "local"
      target_node = "pve2"
    },
    k8s-worker-2 = {
      id          = 3022
      cidr        = "10.10.30.22/24"
      cores       = 4
      gw          = "10.10.30.1"
      macaddr     = "02:DE:4D:48:28:0B"
      memory      = 8192
      disk        = "40G"
      storage     = "local"
      target_node = "pve2"
    },
    k8s-worker-3 = {
      id          = 3023
      cidr        = "10.10.30.23/24"
      cores       = 4
      gw          = "10.10.30.1"
      macaddr     = "02:DE:4D:48:28:0C"
      memory      = 8192
      disk        = "40G"
      storage     = "local"
      target_node = "pve2"
    }
  }
}
