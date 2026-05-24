#!/bin/bash
# Prepara TODOS os artefatos que o `packer build` precisa em
# infra/packer/files/ e infra/packer/cloud-init/. Roda fora da VM,
# antes do build.
#
# Faz:
#   1. Build do frontend (Vite)             -> infra/packer/files/frontend.tar.gz
#   2. Tarball do backend (sem venv/.git)   -> infra/packer/files/backend.tar.gz
#   3. Gera par de chaves SSH efêmero       -> infra/packer/keys/packer.{pem,pub}
#   4. Gera cloud-init/user-data com a chave pública injetada
#
# Uso:
#   ./infra/packer/scripts/build-artifacts.sh
#
# Pré-requisitos no host:
#   - node + npm (pra build do front)
#   - tar, ssh-keygen, sed

set -euo pipefail

# Resolve repo root (este script vive em infra/packer/scripts/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"

BACK_DIR="${REPO_ROOT}/API_5_SEM_BACK"
FRONT_DIR="${REPO_ROOT}/API_5_SEM_FRONT"
PACKER_DIR="${REPO_ROOT}/infra/packer"
FILES_DIR="${PACKER_DIR}/files"
KEYS_DIR="${PACKER_DIR}/keys"
CLOUD_INIT_DIR="${PACKER_DIR}/cloud-init"

mkdir -p "${FILES_DIR}" "${KEYS_DIR}"

# ─── 1. Frontend (Vite) ───────────────────────────────────────────────────────
echo ">> [1/4] build do frontend"
if [[ ! -d "${FRONT_DIR}" ]]; then
  echo "ERRO: ${FRONT_DIR} não existe — rode 'git submodule update --init --recursive'" >&2
  exit 1
fi
(
  cd "${FRONT_DIR}"
  if [[ -f package-lock.json ]]; then
    npm ci
  else
    npm install
  fi
  npm run build
)
tar -czf "${FILES_DIR}/frontend.tar.gz" -C "${FRONT_DIR}/dist" .
echo "   -> ${FILES_DIR}/frontend.tar.gz"

# ─── 2. Backend tarball ───────────────────────────────────────────────────────
echo ">> [2/4] empacotando backend"
if [[ ! -d "${BACK_DIR}" ]]; then
  echo "ERRO: ${BACK_DIR} não existe — rode 'git submodule update --init --recursive'" >&2
  exit 1
fi
tar --exclude='.venv' \
    --exclude='venv' \
    --exclude='__pycache__' \
    --exclude='.git' \
    --exclude='.pytest_cache' \
    --exclude='loadtests' \
    --exclude='docs' \
    --exclude='.coverage' \
    --exclude='coverage.xml' \
    --transform 's,^\.,API_5_SEM_BACK,' \
    -czf "${FILES_DIR}/backend.tar.gz" \
    -C "${BACK_DIR}" .
echo "   -> ${FILES_DIR}/backend.tar.gz"

# ─── 3. Par de chaves efêmero ─────────────────────────────────────────────────
echo ">> [3/4] gerando par de chaves SSH efêmero"
KEY_PATH="${KEYS_DIR}/packer.pem"
if [[ -f "${KEY_PATH}" ]]; then
  echo "   chave já existe — reutilizando ${KEY_PATH}"
else
  ssh-keygen -t ed25519 -N "" -f "${KEY_PATH}" -C "packer-build" >/dev/null
  mv "${KEY_PATH}.pub" "${KEYS_DIR}/packer.pub"
  chmod 600 "${KEY_PATH}"
  echo "   -> ${KEY_PATH}"
fi

# ─── 4. user-data com chave pública injetada ──────────────────────────────────
echo ">> [4/4] gerando cloud-init/user-data"
PUB_KEY="$(cat "${KEYS_DIR}/packer.pub")"
USER_DATA_EXAMPLE="${CLOUD_INIT_DIR}/user-data.example"
USER_DATA="${CLOUD_INIT_DIR}/user-data"

if [[ ! -f "${USER_DATA_EXAMPLE}" ]]; then
  echo "ERRO: ${USER_DATA_EXAMPLE} sumiu" >&2
  exit 1
fi
# sed -i com sintaxe portável (GNU + BSD): usa arquivo temporário
sed "s|SSH_PUBLIC_KEY_PLACEHOLDER|${PUB_KEY}|" \
  "${USER_DATA_EXAMPLE}" > "${USER_DATA}"
echo "   -> ${USER_DATA}"

echo
echo ">> tudo pronto. Para rodar o build:"
echo "   cd infra/packer && packer init . && packer build ."
