// Random password for db
//

resource "random_password" "master_db_password" {
  length           = 20
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
}

// Store passwd in SSM
//
resource "aws_ssm_parameter" "master_db_password" {
  name  = "/saurav/arc_poc/master_db_password"
  value = random_password.master_db_password.result
  type  = "SecureString"
}

// Database craetion

resource "aws_db_instance" "db_saurav" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  identifier             = var.db_identifier
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  multi_az               = var.multi_az
  instance_class         = var.db_instance_class
  username               = var.master_username
  password               = aws_ssm_parameter.master_db_password.value
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  port                   = var.db_port
  vpc_security_group_ids = [aws_security_group.rds_sg_arc_poc.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group_arc_poc.name
  tags                   = var.tags
}

resource "aws_db_subnet_group" "rds_subnet_group_arc_poc" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds_sg_arc_poc" {
  name        = "rds_sg_arc_poc"
  description = "Security group for rds for arc iac training "

  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
