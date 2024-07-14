variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the RDS resources"
}



variable "region" {
  type        = string
  description = "Region of the rds"
}

variable "environment" {
  description = "The environment name for the resources."
}

variable "namespace" {
  type        = string
  description = "Name of the application"
}


variable "master_username" {
  description = "The username for the RDS database"
  type        = string
}


variable "db_identifier" {
  type = string
}


variable "db_instance_class" {
  description = "The RDS instance class"
  type        = string
}



variable "db_storage_size" {
  description = "The allocated storage size for the RDS instance."
  type        = number
}



variable "multi_az" {
  description = "Enable multi-AZ deployment for the RDS instance."
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip the creation of a final DB snapshot when the RDS instance is deleted."
  type        = bool
}

variable "db_engine" {
  description = "The database engine"
  type        = string
}

variable "db_engine_version" {
  description = "The database engine"
  type        = string
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
variable "db_name" {
  type = string
}

variable "db_port" {
  type = number
}