# IaC: AWS (EC2 + Security Group + S3) com Terraform

Infra simples e sólida para portfólio DevOps:
- **EC2** (Amazon Linux 2023) com **Nginx** via `user_data`
- **Security Group**: HTTP(80) e HTTPS(443) liberados, SSH(22) limitado por CIDR
- **S3** com **block public access**, **SSE (AES256)** e **versioning**
- Boas práticas: variáveis, tags, Makefile, `.gitignore`

## Pré-requisitos
- Terraform >= 1.6
- Conta AWS com credenciais configuradas (`aws configure` ou variáveis `AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY`)
- Uma chave pública local (ex.: `~/.ssh/id_rsa.pub`)

## Variáveis principais
- `aws_region` (default: `us-east-1`)
- `instance_type` (default: `t3.micro`)
- `allowed_ssh_cidr` (default: `0.0.0.0/0`) **=> altere para seu IP**
- `public_key_path` (default: `~/.ssh/id_rsa.pub`)
- `bucket_name_prefix` (default: `iac-basic-artifacts`)

## Como usar
```bash
make init
make fmt validate
make plan
make apply
```

## Image

![Texto alternativo](https://imgur.com/W45XeK8)