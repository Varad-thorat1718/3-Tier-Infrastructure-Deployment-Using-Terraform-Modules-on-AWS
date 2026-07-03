resource "aws_vpc_security_group_ingress_rule" "allow_mysql_from_app_to_rds" {
  security_group_id            = module.rds.rds_security_group_id
  referenced_security_group_id = module.ec2.app_security_group_id

  ip_protocol = "tcp"
  from_port   = 3306
  to_port     = 3306

  description = "Allow MySQL access from App Tier EC2 to RDS"
}
