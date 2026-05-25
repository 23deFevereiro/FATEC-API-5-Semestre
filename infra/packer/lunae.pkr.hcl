packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

# ─── Variables ────────────────────────────────────────────────────────────────
variable "vm_name" {
  default = "lunae"
}

variable "version" {
  description = "Sufixo da versão da imagem (vira lunae-<version>.qcow2)"
  default     = "dev"
}

variable "disk_size" {
  default = "20G"
}

variable "iso_url" {
  description = "Caminho/URL para a imagem cloud base"
  default     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

variable "iso_checksum" {
  default = "file:https://cloud-images.ubuntu.com/noble/current/SHA256SUMS"
}

variable "ssh_private_key_file" {
  description = "Chave privada usada pelo Packer pra entrar via SSH na VM de build"
  default     = "./keys/packer.pem"
}

# ─── Source ───────────────────────────────────────────────────────────────────

source "qemu" "ubuntu_noble" {
  memory = 4096
  cpus   = 3

  disk_image   = true
  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum

  format    = "qcow2"
  disk_size = var.disk_size

  headless = true

  accelerator = "kvm"

  ssh_username         = "ubuntu"
  ssh_timeout          = "20m"
  ssh_private_key_file = var.ssh_private_key_file

  cd_files = ["./cloud-init/user-data", "./cloud-init/meta-data"]
  cd_label = "cidata"

  output_directory = "output"
  vm_name          = "${var.vm_name}-${var.version}.qcow2"
}

# ─── Build ────────────────────────────────────────────────────────────────────

build {
  sources = ["source.qemu.ubuntu_noble"]

  provisioner "shell" {
    inline = [
      "echo '>> aguardando cloud-init terminar'",
      "cloud-init status --wait",
      "sudo mkdir -p /var/www/lunae /tmp/packer",
      "sudo chmod 777 /var/www/lunae /tmp/packer",
    ]
  }

  provisioner "file" {
    source      = "./files/backend.tar.gz"
    destination = "/tmp/packer/backend.tar.gz"
  }

  provisioner "file" {
    source      = "./files/frontend.tar.gz"
    destination = "/tmp/packer/frontend.tar.gz"
  }

  provisioner "file" {
    source      = "./files/nginx-site.conf"
    destination = "/tmp/packer/nginx-site.conf"
  }

  provisioner "file" {
    source      = "./files/lunae-backend.service"
    destination = "/tmp/packer/lunae-backend.service"
  }

  provisioner "shell" {
    script          = "./scripts/install.sh"
    execute_command = "sudo bash '{{.Path}}'"
  }
}
