output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}

output "environment" {
  value = "dev-environment"
}