packer {
  required_plugins {
    qemu = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

source "qemu" "ubuntu_minimal" {
  # 1. Arquivo de imagem que você já tem na máquina
  iso_url      = "./ubuntu-24.04.4-live-server-amd64.iso"
  iso_checksum = "sha256:e907d92eeec9df64163a7e454cbc8d7755e8ddc7ed42f99dbc80c40f1a138433"

  # 2. Configurações da máquina virtual (Básicas por falta de KVM)
  accelerator = "tcg"
  headless    = true
  cpus        = 2
  memory      = 2048
  disk_size   = "10000M"
  format      = "raw"

  # 3. O Pulo do Gato: Injeta a pasta http como um CD-ROM de configuração
  cd_files = ["infra/packer/http/user-data", "infra/packer/http/meta-data"]
  cd_label = "cidata"

  # 4. Credenciais que o Packer vai usar para entrar via SSH após a instalação
  ssh_username     = "ubuntu"
  ssh_password     = "packer123"
  ssh_timeout      = "20m"
  shutdown_command = "echo 'packer123' | sudo -S shutdown -P now"

  # Como os dados já entram pelo CD-ROM, o boot só precisa dar 'Enter' no GRUB
  boot_wait    = "5s"
  boot_command = ["<enter>"]
}

build {
  sources = ["source.qemu.ubuntu_minimal"]
  # (Deixamos os provisioners/scripts vazios por enquanto. Vamos primeiro fazer o SSH conectar!)
}
