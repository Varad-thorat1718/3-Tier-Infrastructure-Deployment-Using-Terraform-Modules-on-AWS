output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.vpc.nat_gateway_id
}

output "web_instance_id" {
  description = "Web EC2 instance ID"
  value       = module.ec2.web_instance_id
}

output "web_public_ip" {
  description = "Web EC2 public IP"
  value       = module.ec2.web_public_ip
}

output "web_public_dns" {
  description = "Web EC2 public DNS"
  value       = module.ec2.web_public_dns
}

output "app_instance_id" {
  description = "App EC2 instance ID"
  value       = module.ec2.app_instance_id
}

output "app_private_ip" {
  description = "App EC2 private IP"
  value       = module.ec2.app_private_ip
}

output "db_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.db_endpoint
}

output "db_name" {
  description = "Database name"
  value       = module.rds.db_name
}
