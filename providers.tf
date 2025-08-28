provider "aws" {
  region = var.aws_region
}

# Opcional: habilite backend remoto (S3) depois que o bucket existir.
# Exemplo (edite após criar um bucket para state):
# terraform {
#   backend "s3" {
#     bucket = "meu-bucket-state-terraform"
#     key    = "iac-basic/terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
#   }
# }