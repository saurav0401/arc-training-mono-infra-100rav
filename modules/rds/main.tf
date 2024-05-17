resource "random_password" "password" {
  length           = 16 // Set your desired password length
  special          = true
  override_special = "!@#$%^&*()_+"
}

resource "aws_ssm_parameter" "password_param" {
  name  = "saurav-rds-password" // Set your desired SSM parameter name
  type  = "SecureString"
  value = random_password.password.result
}

resource "aws_db_instance" "rds_instance" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = aws_ssm_parameter.password_param.value
  db_subnet_group_name   = var.db_subnet_group_name
  parameter_group_name   = var.parameter_group_name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot    = true

}