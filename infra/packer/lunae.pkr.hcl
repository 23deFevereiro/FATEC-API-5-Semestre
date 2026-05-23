packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

variable "vm_name" {
  default = "lunae"
}

variable "disk_size" {
  default = "20G"
}

# Senha removida — imagem cloud usa SSH key
# Mas mantemos uma variável de senha pra criar usuário no provisionamento
variable "app_user_password" {
  default   = "packer123"
  sensitive = true
}

source "qemu" "debian12" {
  memory = 4096
  cpus   = 3

  # Imagem cloud já instalada — sem instalador
  disk_image   = true
  iso_url      = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
  iso_checksum = "file:https://cloud.debian.org/images/cloud/bookworm/latest/SHA256SUMS"

  format    = "qcow2"
  disk_size = var.disk_size

  headless = true

  # Imagem cloud do Debian usa usuário "debian" por padrão
  ssh_username = "debian"
  ssh_timeout  = "10m"   # muito mais curto agora

  # Autenticação por chave SSH
  ssh_private_key_file = "infra/packer/keys/packer.pem"

  # Não precisa mais de:
  # - http_directory
  # - boot_command
  # - boot_wait
  # - preseed.cfg

  # Necessário para imagem cloud inicializar corretamente
  cd_files = ["infra/packer/cloud-init/*"]
  cd_label = "cidata"

  output_directory = "output"
  vm_name          = "${var.vm_name}.qcow2"
}

build {
  sources = ["source.qemu.debian12"]

  provisioner "shell" {
    inline = ["echo 'Sistema pronto'"]
  }

  provisioner "file" {
    source      = "API_5_SEM_FRONT/dist/"
    destination = "/var/www/app/"
  }

  provisioner "file" {
    source      = "API_5_SEM_BACK/"
    destination = "/opt/app/"
  }

  provisioner "shell" {
    script = "infra/packer/scripts/install.sh"
  }
}
