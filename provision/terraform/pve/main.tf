terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.0"
    }

    sops = {
      source = "carlpett/sops"
      version = "0.6.3"
    }
  }
}

data "sops_file" "pve_secrets" {
  source_file = "secret.sops.yaml"
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = data.sops_file.pve_secrets.data["pve.api_url"]
    pm_user = data.sops_file.pve_secrets.data["pve.user"]
    pm_password = data.sops_file.pve_secrets.data["pve.user_password"]
    pm_parallel = 4
}
