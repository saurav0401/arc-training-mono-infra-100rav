variable "aws_region" {
  type    = string
  default = "us-east-2"
}
variable "subnet_id" {
  type = string


}
variable "instance_ami" {
  type = string
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "vpc_id" {
  type = string

}
variable "key_name" {
  description = "The name prefix for key pair"
}

variable "associate_public_ip_address" {
  type    = bool
  default = false
}
variable "volume_type" {
  type    = string
  default = "gp3"
}
variable "volume_size" {
  type    = number
  default = 8
}

variable "encrypted" {
  type    = bool
  default = true
}
variable "delete_on_termination" {
  type    = bool
  default = false
}
variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
variable "private_key_path" {
  type    = string
  default = null
}
variable "key_pair" {
  type    = string
  default = "arc_poc_key"
}
variable "name" {
  default = null
  type    = string
}
variable "tags" {
  description = "A map of tags to apply to the resources."
  type        = map(string)
}
variable "security_group_name" {
  default = "arc_poc_sg"
  type    = string
}
