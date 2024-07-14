variable "region" {
  default = "us-east-1"
  type    = string
}
variable "cidr_block" {
  type = string
}
variable "public_cidrs" {
  type = list(string)
}
variable "private_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "vpc_tags" {
  description = "tags name"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "VPC name"
}
