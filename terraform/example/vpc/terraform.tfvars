region = "us-east-2"
vpc_cidr_block             = "192.168.0.0/16"
public_subnet_cidr_blocks  = ["192.168.0.0/18", "192.168.64.0/18"]
private_subnet_cidr_blocks = ["192.168.128.0/18", "192.168.192.0/18"]
availability_zones         = ["us-east-2a", "us-east-2b"]
vpc_name                   = "vpc-naman-arc-poc"
vpc_tags                   = { "Name" = "vpc-naman-arc-poc" }
