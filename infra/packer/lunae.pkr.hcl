packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

# ─── Variáveis ────────────────────────────────────────────────────────────────
# Paths são relativos a este arquivo (que o workflow chama com
# `working-directory: infra/packer`). Não prefixe com `infra/packer/`.

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
  description = "Caminho/URL para a imagem cloud base (qcow2)"
  default     = "./debian-12-genericcloud-amd64.qcow2"
}

variable "iso_checksum" {
  default = "sha512:774bee87378198fe9c52285c61de05bd5daac22ea54856040f9b38465e86c960d54f4667dcb71ab1117b372731131704e646a586bdbb48c56b9e5e2583cd0f23"
}

variable "ssh_private_key_file" {
  description = "Chave privada usada pelo Packer pra entrar via SSH na VM de build"
  default     = "./keys/packer.pem"
}

# ─── Source ───────────────────────────────────────────────────────────────────

source "qemu" "debian12" {
  memory = 4096
  cpus   = 3

  # Imagem cloud já instalada — sem instalador
  disk_image   = true
  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum

  format    = "qcow2"
  disk_size = var.disk_size

  headless = true

  # KVM se disponível no host; o builder cai para tcg automaticamente
  # se /dev/kvm não estiver acessível. Em CI (ubuntu-latest) tem KVM.
  accelerator = "kvm"

  # Hardware moderno — virtio é o que as cloud images têm driver pronto.
  # Sem isto, o builder usa rtl8139, que em algumas imagens não sobe a
  # tempo e quebra o DHCP/DNS durante o provisionamento.
  machine_type   = "q35"
  net_device     = "virtio-net"
  disk_interface = "virtio"

  # Força DNS público no SLIRP — evita o caso em que o /etc/resolv.conf
  # do host só aponta pra 127.0.0.53 (systemd-resolved stub), o que faria
  # a VM herdar um DNS inalcançável e dar "Temporary failure resolving".
  qemuargs = [
    ["-netdev", "user,id=user.0,hostfwd=tcp::{{ .SSHHostPort }}-:22,dns=8.8.8.8"],
    ["-device", "virtio-net,netdev=user.0"],
  ]

  # Imagem cloud do Debian usa usuário "debian" por padrão
  ssh_username         = "debian"
  ssh_timeout          = "10m"
  ssh_private_key_file = var.ssh_private_key_file

  # NoCloud datasource — exige arquivos com nome exato `user-data` e `meta-data`.
  # `user-data` é gerado/copiado a partir do `.example` pelo workflow (ou pelo
  # script local em scripts/build-artifacts.sh) e está no .gitignore.
  cd_files = [
    "./cloud-init/user-data",
    "./cloud-init/meta-data",
  ]
  cd_label = "cidata"

  output_directory = "output"
  vm_name          = "${var.vm_name}-${var.version}.qcow2"
}

# ─── Build ────────────────────────────────────────────────────────────────────

build {
  sources = ["source.qemu.debian12"]

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
