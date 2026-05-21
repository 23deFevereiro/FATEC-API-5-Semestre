# Packer template — empacota a stack Lunae (front + back) numa VM
# instalada do zero a partir do ISO oficial do Ubuntu Server 24.04.
# Builder: virtualbox-iso. Output: .vdi (extraído do OVA pelo workflow).

packer {
  required_version = ">= 1.10.0"
  required_plugins {
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = ">= 1.0.0"
    }
  }
}

# ───────────────────────────── Variáveis ────────────────────────────────

variable "version" {
  type    = string
  default = "dev"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/24.04/ubuntu-24.04.1-live-server-amd64.iso"
}

variable "iso_checksum" {
  type    = string
  default = "file:https://releases.ubuntu.com/24.04/SHA256SUMS"
}

variable "build_cpus" {
  type    = number
  default = 2
}

variable "build_memory_mb" {
  type    = number
  default = 2048
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

variable "ssh_private_key_file" {
  type        = string
  description = "Chave SSH privada para o Packer conectar na VM em build. A pública correspondente é injetada em http/user-data via sed no workflow."
}

# ─────────────────────── Builder virtualbox-iso ─────────────────────────

source "virtualbox-iso" "lunae" {
  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum

  guest_os_type = "Ubuntu_64"
  vm_name       = "lunae-${var.version}"
  cpus          = var.build_cpus
  memory        = var.build_memory_mb
  disk_size     = 20480
  hard_drive_interface = "sata"
  headless      = true

  # Diretório servido por HTTP durante o build — o instalador do Ubuntu
  # baixa user-data e meta-data daqui via nocloud-net.
  http_directory = "http"

  boot_wait = "5s"
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz quiet autoinstall ds='nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/' ---<enter><wait>",
    "initrd /casper/initrd<enter><wait>",
    "boot<enter>"
  ]

  ssh_username             = var.ssh_username
  ssh_private_key_file     = var.ssh_private_key_file
  ssh_timeout              = "30m"
  ssh_handshake_attempts   = 100

  shutdown_command = "sudo -S shutdown -P now"

  # Pular guest additions — não precisamos pra rodar a aplicação.
  guest_additions_mode = "disable"

  output_directory = "output"
  format           = "ova"
}

# ─────────────────────────── Build ──────────────────────────────────────

build {
  name    = "lunae"
  sources = ["source.virtualbox-iso.lunae"]

  # 0) Garante /tmp/packer/ como diretório antes dos uploads.
  provisioner "shell" {
    inline = [
      "mkdir -p /tmp/packer",
      "chmod 777 /tmp/packer",
    ]
  }

  # 1) Sobe os arquivos que o provision.sh espera em /tmp/packer/
  provisioner "file" {
    source      = "../../backend.tar.gz"
    destination = "/tmp/packer/backend.tar.gz"
  }

  provisioner "file" {
    source      = "../../frontend.tar.gz"
    destination = "/tmp/packer/frontend.tar.gz"
  }

  provisioner "file" {
    source      = "files/nginx-site.conf"
    destination = "/tmp/packer/nginx-site.conf"
  }

  provisioner "file" {
    source      = "files/lunae-backend.service"
    destination = "/tmp/packer/lunae-backend.service"
  }

  # 2) Roda o provisionamento como root (sudo sem senha via sudoers.d)
  provisioner "shell" {
    execute_command = "sudo -E bash '{{ .Path }}'"
    script          = "scripts/provision.sh"
  }
}
