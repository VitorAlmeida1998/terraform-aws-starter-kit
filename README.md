# ☁️ IaC: AWS (EC2 + Security Group + S3) com Terraform

[![AWS](https://img.shields.io/badge/AWS-232F3E?logo=amazon-aws&logoColor=white)]()
[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)]()
[![Nginx](https://img.shields.io/badge/Nginx-009639?logo=nginx&logoColor=white)]()
[![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=000)]()
[![Makefile](https://img.shields.io/badge/Makefile-000000?logo=gnu&logoColor=white)]()

Infraestrutura simples e sólida para portfólio **DevOps**:

- 🚀 **EC2** (Amazon Linux 2023) com **Nginx** via `user_data`  
- 🔒 **Security Group**: HTTP (80) e HTTPS (443) liberados, SSH (22) restrito por **CIDR**  
- 📦 **S3** com **Block Public Access**, **SSE (AES256)** e **Versioning** habilitado  
- 🛠️ **Boas práticas**: variáveis, tags, Makefile, `.gitignore`  

---

## ✅ Pré-requisitos
- [![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)]() **>= 1.6**  
- [![AWS](https://img.shields.io/badge/AWS%20CLI-232F3E?logo=amazon-aws&logoColor=white)]() Conta AWS com credenciais configuradas (`aws configure` ou variáveis `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY`)  
- 🔑 Chave pública local (ex.: `~/.ssh/id_rsa.pub`)  

---

## ⚙️ Variáveis principais
- `aws_region` → default: `us-east-1`  
- `instance_type` → default: `t3.micro`  
- `allowed_ssh_cidr` → default: `0.0.0.0/0` **(altere para seu IP)**  
- `public_key_path` → default: `~/.ssh/id_rsa.pub`  
- `bucket_name_prefix` → default: `iac-basic-artifacts`  

---

## 🚀 Como usar
```bash
make init
make fmt validate
make plan
make apply
