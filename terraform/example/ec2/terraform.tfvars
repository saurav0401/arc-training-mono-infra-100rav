region = "us-east-1"
environment         = "arc-poc"
namespace           = "saurav"
key_name            = "arc_instance_key"
root_volume_type    = "gp2"
root_volume_size    = 8
associate_public_ip = true
instance_ami = {
  instance_type = "t2.micro"
}

## sg_rules ####
name = "arc-poc-saurav"

ingress_rules = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
]
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  },

]
tags = {
  Name        = "ec2_saurav_arc_poc"
  Environment = "poc"

}
