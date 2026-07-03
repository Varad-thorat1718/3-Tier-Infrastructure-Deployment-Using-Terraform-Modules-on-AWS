output "db_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "db_address" {
  description = "RDS database address"
  value       = aws_db_instance.mysql.address
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.mysql.db_name
}

output "rds_security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.rds_sg.id
}
