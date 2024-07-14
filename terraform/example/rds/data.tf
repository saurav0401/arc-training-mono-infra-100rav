data "aws_vpc" "vpc_arc_poc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.namespace}-${var.environment}"]
  }
}

data "aws_subnets" "poc_arc_subnets" {
  filter {
    name = "tag:Name"
    values = [
      "subnet_private_arc_poc_1",
      "subnet_private_arc_poc_2",
    ]
  }
}
