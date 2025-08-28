#!/bin/bash
set -euo pipefail

# Atualiza e instala Nginx
dnf update -y
dnf install -y nginx

# Página simples com informações úteis
cat >/usr/share/nginx/html/index.html <<'HTML'
<!doctype html>
<html>
  <head><meta charset="utf-8"><title>DevOps Web</title></head>
  <body style="font-family: sans-serif">
    <h1>Terraform + AWS EC2 + Nginx</h1>
    <p>Provisionado via Terraform por <strong>Vitor</strong>.</p>
    <ul>
      <li>EC2: Amazon Linux 2023</li>
      <li>SG: 80/443 liberados, 22 restrito</li>
      <li>S3: criptografia + versionamento</li>
    </ul>
  </body>
</html>
HTML

systemctl enable nginx
systemctl start nginx
