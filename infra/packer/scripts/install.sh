#!/bin/bash

set -euo pipefail

echo ">> aguardando cloud-init terminar (build)"
cloud-init status --wait

echo ">> apt update + pacotes base"
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get upgrade -y
apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip \
    nginx \
    postgresql-client \
    ca-certificates

echo ">> criando usuário lunae"
id -u lunae &>/dev/null || useradd -r -m -s /usr/sbin/nologin -d /opt/lunae lunae

echo ">> instalando backend em /opt/lunae/backend"
mkdir -p /opt/lunae/backend
tar -xzf /tmp/packer/backend.tar.gz -C /opt/lunae/backend --strip-components=1
chown -R lunae:lunae /opt/lunae

echo ">> criando venv e instalando dependências"
sudo -u lunae python3 -m venv /opt/lunae/backend/.venv
sudo -u lunae /opt/lunae/backend/.venv/bin/pip install --no-cache-dir --upgrade pip
sudo -u lunae /opt/lunae/backend/.venv/bin/pip install --no-cache-dir \
    -r /opt/lunae/backend/requirements.txt

echo ">> instalando frontend em /var/www/lunae"
mkdir -p /var/www/lunae
tar -xzf /tmp/packer/frontend.tar.gz -C /var/www/lunae
chown -R www-data:www-data /var/www/lunae

echo ">> configurando nginx"
cp /tmp/packer/nginx-site.conf /etc/nginx/sites-available/lunae
ln -sf /etc/nginx/sites-available/lunae /etc/nginx/sites-enabled/lunae
rm -f /etc/nginx/sites-enabled/default
nginx -t

echo ">> configurando systemd unit"
cp /tmp/packer/lunae-backend.service /etc/systemd/system/lunae-backend.service
systemctl daemon-reload
systemctl enable lunae-backend.service
systemctl enable nginx.service

echo ">> limpeza para reduzir tamanho da imagem"
# apt-get clean
# rm -rf /tmp/packer
# rm -rf /var/lib/apt/lists/*
# rm -rf /var/log/*.log /var/log/apt/* /var/log/nginx/*
# cloud-init clean --logs --seed

echo ">> provisioning concluído"
