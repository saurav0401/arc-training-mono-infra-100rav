# variable "aws_region" {
#   description = "The region in AWS where you want to deploy resources"
#   type = string
#   default = "us-east-1"
# }

variable "identifier" {
  description = "Identifier for the RDS instance"
  type = string
}

variable "allocated_storage" {
  description = "Allocated storage for the RDS instance"
  type = number
}

variable "engine" {
  description = "Database engine type for the RDS instance"
  type = string

}

variable "engine_version" {
  description = "Database engine version for the RDS instance"
  type = string
}

variable "instance_class" {
  description = "Instance class for the RDS instance"
  type = string
}

variable "username" {
  description = "Username for the RDS instance"
  type = string
}

# variable "password" {
#   description = "Password for the RDS instance"
#   type = string
# }

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type = string
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type = string
}

variable "security_group_id" {
  description = "Security group ID"
  type = string
}
