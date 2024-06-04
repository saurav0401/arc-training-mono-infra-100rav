module network {
  source = "../network"
}
resource "random_password" "password" {
  length           = 16 // Set your desired password length
  special          = true
  override_special = "!@#$%^&*()_+"
}
resource "aws_ssm_parameter" "password_param" {
  name  = "saurv-rds-password" // Set your desired SSM parameter name
  type  = "SecureString"
  value = random_password.password.result
}
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = [module.network.subnet_id[0], module.network.subnet_id[1]]
}
resource "aws_db_instance" "rds_instance" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = aws_ssm_parameter.password_param.value
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.id
  parameter_group_name   = var.parameter_group_name
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]
  skip_final_snapshot    = true
}
/* resource "aws_db_subnet_group" "subnet-group-1" {
  name       = "xyz"
  subnet_ids = module.vpc.public_subnets
  tags = {
    Name = "Education"
  }
}
resource "aws_db_parameter_group" "parameter_group" {
  name   = "abc"
  family = "postgres14"
  parameter {
    name  = "log_connections"
    value = "1"
  }
} */
resource "aws_security_group" "instance_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = module.network.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
