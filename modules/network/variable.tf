variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "vpc_name" {
  default = "my-vpc"
}

variable "igw_name" {
  default = "my-igw"
}

variable "public_subnet_cidr_1" {
  default = "10.1.1.0/24"
}

variable "public_subnet_cidr_2" {
  default = "10.1.2.0/24"
}

variable "public_subnet_name_1" {
  default = "public-subnet-1"
}

variable "public_subnet_name_2" {
  default = "public-subnet-2"
}

variable "private_subnet_cidr_1" {
  default = "10.1.3.0/24"
}

variable "private_subnet_cidr_2" {
  default = "10.1.4.0/24"
}

variable "private_subnet_name_1" {
  default = "private-subnet-1"
}

variable "private_subnet_name_2" {
  default = "private-subnet-2"
}

variable "availability_zone_1" {
  default = "us-east-1a"
}

variable "availability_zone_2" {
  default = "us-east-1b"
}

variable "public_route_table_name" {
  default = "public-route-table"
}

variable "nat_gateway_name" {
  default = "my-nat-gateway"
}
