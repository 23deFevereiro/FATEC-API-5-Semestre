# Cloud-init examples — lado cliente

Arquivos modelo que o cliente final usa pra configurar uma VM Lunae no
primeiro boot. **Não são** os arquivos usados durante o build da imagem
(esses ficam em `infra/packer/cloud-init/`).

## Uso

1. Copie os dois arquivos pra um diretório de trabalho:
   ```bash
   cp client-user-data.yaml /tmp/seed/user-data
   cp client-meta-data.yaml /tmp/seed/meta-data
   ```
   Os arquivos no ISO **precisam** se chamar exatamente `user-data` e
   `meta-data` (sem extensão).

2. Edite `user-data` substituindo:
   - A chave pública SSH (linha `ssh-ed25519 AAAA...`)
   - As variáveis em `write_files` → `.env` (banco, secret key, allowed hosts)

3. Edite `meta-data` substituindo `instance-id` por algo único pra essa VM.

4. Empacote como ISO com label `cidata` (case-insensitive, mas use lowercase):
   ```bash
   genisoimage -output lunae-seed.iso -volid cidata -joliet -rock \
               user-data meta-data
   ```
   Alternativas no Windows: `oscdimg.exe -lcidata <dir> lunae-seed.iso`,
   AnyBurn, ou ImgBurn (todos aceitam definir volume label).

5. Anexe `lunae-seed.iso` como CD-ROM na VM (VirtualBox, Hyper-V, QEMU,
   OCI, AWS, etc.) e dá boot.

## Verificação pós-boot

```bash
sudo cloud-init status --long          # esperado: status: done
ls -la /opt/lunae/backend/.env          # tem que existir, owner lunae:lunae
systemctl status lunae-backend nginx    # ambos active (running)
```

## Pegadinhas

- **CRLF / BOM**: salvar os arquivos com line ending Unix (LF) e sem BOM.
  Cloud-init descarta silenciosamente se a primeira linha não for
  exatamente `#cloud-config\n`.
- **Label do ISO**: tem que ser `cidata`. Sem isso o NoCloud datasource
  não encontra o seed.
- **Atualizar `.env` depois do primeiro boot**: cloud-init não roda de
  novo a menos que o `instance-id` mude. Pra reconfigurar, ou edita
  manualmente o arquivo via SSH, ou troca o `instance-id` no meta-data
  e roda `sudo cloud-init clean --logs && sudo reboot`.
