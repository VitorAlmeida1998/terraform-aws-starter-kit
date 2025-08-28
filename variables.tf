variable "project_name" {
  description = "Nome do projeto para tags e nomes de recursos."
  type        = string
  default     = "iac-basic"
}

variable "aws_region" {
  description = "Região AWS."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2."
  type        = string
  default     = "t3.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR permitido para SSH (22)."
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_key_path" {
  description = "Caminho para a chave pública SSH a ser registrada como Key Pair."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "bucket_name_prefix" {
  description = "Prefixo para o bucket S3 (um sufixo aleatório será adicionado)."
  type        = string
  default     = "iac-basic-artifacts"
}

variable "enable_s3_versioning" {
  description = "Habilita versionamento no S3."
  type        = bool
  default     = true
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
