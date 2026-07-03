variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EC2 instances will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID for web tier EC2"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for app tier EC2"
  type        = string
}

variable "web_instance_type" {
  description = "Instance type for web tier EC2"
  type        = string
}

variable "app_instance_type" {
  description = "Instance type for app tier EC2"
  type        = string
}

variable "db_host" {
  description = "RDS database host address"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_pass" {
  description = "Database password"
  type        = string
  sensitive   = true
}
