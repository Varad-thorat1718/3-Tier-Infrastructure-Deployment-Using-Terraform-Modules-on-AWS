output "web_instance_id" {
  description = "Web tier EC2 instance ID"
  value       = aws_instance.web.id
}

output "web_public_ip" {
  description = "Public IP of web tier EC2"
  value       = aws_instance.web.public_ip
}

output "web_public_dns" {
  description = "Public DNS of web tier EC2"
  value       = aws_instance.web.public_dns
}

output "app_instance_id" {
  description = "App tier EC2 instance ID"
  value       = aws_instance.app.id
}

output "app_private_ip" {
  description = "Private IP of app tier EC2"
  value       = aws_instance.app.private_ip
}

output "web_security_group_id" {
  description = "Web tier security group ID"
  value       = aws_security_group.web_sg.id
}

output "app_security_group_id" {
  description = "App tier security group ID"
  value       = aws_security_group.app_sg.id
}
