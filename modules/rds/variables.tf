variable "aws_region" {
  description = "The region in AWS where you want to deploy resources"
  type = string
  default = "us-east-1"
}
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
# variable "db_subnet_group_name" {
#   description = "Name of the DB subnet group"
#   type = string
# }
variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type = string
}
# variable "security_group_id" {
#   description = "Security group ID"
#   type = string
# }
variable "db_subnet_group_name" {
  description = "RDS subnet group name"
  type = string
}
variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "instance_security_group"
}
variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for the EC2 instance"
}
variable "ingress_rules" {
  description = "A map of ingress rules"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    ssh = {
      description = "SSH Port allowed for all"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # Add more ingress rules as needed
  }
}
variable "egress_rules" {
  description = "A map of egress rules"
  type = map(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    all_traffic = {
      description = "All outbound traffic allowed"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
    # Add more egress rules as needed
  }
}
