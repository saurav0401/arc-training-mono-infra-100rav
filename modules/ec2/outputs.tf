output "aws_region" {
  description = "The region in AWS where resources are deployed"
  value       = var.aws_region
}

output "name" {
  description = "Name of the EC2 instance"
  value       = var.name
}

output "ami" {
  description = "AMI used to launch the EC2 instance"
  value       = var.ami
}

output "instance_type" {
  description = "The EC2 instance type"
  value       = var.instance_type
}

output "key_name" {
  description = "The private key used to connect to the EC2 instance"
  value       = var.key_name
}

output "subnet_id" {
  description = "The subnet ID where the EC2 instance is launched"
  value       = var.subnet_id
}

output "security_group_id" {
  description = "The security group ID attached to the EC2 instance"
  value       = var.security_group_id
}

output "key_pair" {
  description = "The key pair used for the EC2 instance"
  value       = var.key_pair
}
