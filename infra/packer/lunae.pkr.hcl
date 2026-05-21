# Packer template — empacota a stack Lunae (front + back) numa imagem
# qcow2 baseada em Ubuntu Server 24.04 cloud image.
# Saída: output/lunae-<version>.qcow2
# Pensado pra rodar no GitHub Actions com KVM no runner ubuntu-latest.

packer {
  required_version = ">= 1.10.0"
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = ">= 1.0.0"
    }
  }
}

# ───────────────────────────── Variáveis ────────────────────────────────

variable "version" {
  type        = string
  default     = "dev"
  description = "Versão da imagem. Vira parte do nome do output."
}

variable "ssh_private_key_file" {
  type        = string
  description = "Path da chave SSH privada que o Packer usa para conectar na VM temporária. Gerada pelo workflow GHA."
}

variable "build_cpus" {
  type        = number
  default     = 2
  description = "vCPUs alocadas para a VM de build (não influencia a imagem final)."
}

variable "build_memory_mb" {
  type        = number
  default     = 2048
  description = "RAM alocada para a VM de build (não influencia a imagem final)."
}

# Base image — Ubuntu 24.04 LTS (Noble) cloud image oficial.
# Atualizar periodicamente conforme novas releases.
variable "base_image_url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

variable "base_image_checksum" {
  type    = string
  default = "file:https://cloud-images.ubuntu.com/noble/current/SHA256SUMS"
}

# ───────────────────────── Builder QEMU ─────────────────────────────────

source "qemu" "lunae" {
  iso_url      = var.base_image_url
  iso_checksum = var.base_image_checksum

  # disk_image = true → tratar o iso_url como disco base (não como ISO de instalação)
  disk_image       = true
  disk_size        = "20G"
  format           = "qcow2"
  accelerator      = "kvm"
  headless         = true
  output_directory = "output"
  vm_name          = "lunae-${var.version}.qcow2"

  cpus     = var.build_cpus
  memory   = var.build_memory_mb

  # cloud-init via cidata ISO — fornece chave SSH para Packer conectar
  cd_files = [
    "cloud-init-build/user-data",
    "cloud-init-build/meta-data",
  ]
  cd_label = "cidata"

  # SSH config — usuário "ubuntu" criado pelo cloud-init acima
  ssh_username         = "ubuntu"
  ssh_private_key_file = var.ssh_private_key_file
  ssh_timeout          = "10m"

  shutdown_command = "sudo -S shutdown -P now"
}

# ─────────────────────────── Build ──────────────────────────────────────

build {
  name    = "lunae"
  sources = ["source.qemu.lunae"]

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

  # 2) Roda o provisionamento como root
  provisioner "shell" {
    execute_command = "sudo -E bash '{{ .Path }}'"
    script          = "scripts/provision.sh"
  }
}
