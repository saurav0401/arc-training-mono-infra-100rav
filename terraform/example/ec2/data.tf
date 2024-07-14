data "aws_vpc" "vpc_arc_poc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.namespace}-${var.environment}"]
  }
}


data "aws_subnet" "poc_arc_subnets" {
  filter {
    name   = "tag:Name"
    values = ["poc_subnet_public1"]
  }
}
data "aws_ami" "arc_poc_latest_linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
