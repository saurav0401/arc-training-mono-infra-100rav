aws_region                     = "us-east-1"
instance_type               = "t2.micro"
subnet_id                   = "subnet-0a4053f67ea8a8397"
vpc_id                      = "vpc-0220f279cfeef7591"
key_name                    = "ec2_key_arc_poc"
associate_public_ip_address = true
volume_size                 = 8
volume_type                 = "gp3"
encrypted                   = true
delete_on_termination       = true
tags = {
  "Name"        = "saurav-ec2-arc-poc"
  "environment" = "ARC-IAC-training"
}
ingress_rules = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

]
