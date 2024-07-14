variable "name" {
  description = "Name for the resources"
  type        = string
}
variable "instance_ami" {
  description = "AMI for the instance"
  type = object({
    instance_type = string
  })
}

variable "key_name" {
  description = "Name for the key_pair"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
}

variable "root_volume_type" {
  description = "The type of root volume for the EC2 instance (e.g., gp2, io1)."
}

variable "root_volume_size" {
  description = "The size of the root volume for the EC2 instance (in GB)."
  type        = number
}

variable "associate_public_ip" {
  description = "The size of the root volume for the EC2 instance (in GB)."
  type        = bool
}

variable "namespace" {
  description = "name of the project"
}

variable "environment" {
  description = "name of the environment"
}

variable "region" {
  type = string
}
