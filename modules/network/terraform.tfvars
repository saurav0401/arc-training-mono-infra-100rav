region             = "us-east-1"
cidr_block         = "192.168.0.0/16"
public_cidrs       = ["192.168.0.0/18", "192.168.64.0/18"]
private_cidrs      = ["192.168.128.0/18", "192.168.192.0/18"]
availability_zones = ["us-east-1a", "us-east-1b"]
vpc_name           = "vpc-saurav-arc-poc"
vpc_tags = {
  "created by"  = "saurav"
  "environment" = "ARC-IAC-training"
}