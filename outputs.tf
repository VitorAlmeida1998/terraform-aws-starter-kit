output "s3_bucket_name" {
  description = "Nome do bucket S3 criado."
  value       = aws_s3_bucket.app_bucket.bucket
}

output "ec2_public_ip" {
  description = "IP público da EC2."
  value       = aws_instance.web.public_ip
}

output "ec2_public_dns" {
  description = "DNS público da EC2."
  value       = aws_instance.web.public_dns
}

output "security_group_id" {
  description = "ID do Security Group."
  value       = aws_security_group.web_sg.id
}