module "ec2_instance" {
  source = "../../../modules/ec2"

  name                        = var.name
  vpc_id                      = data.aws_vpc.vpc_arc_poc.id
  subnet_id                   = data.aws_subnet.poc_arc_subnets.id
  key_name                    = var.key_name
  instance_ami                = data.aws_ami.arc_poc_latest_linux_ami.id
  ingress_rules               = var.ingress_rules
  egress_rules                = var.egress_rules
  volume_type                 = var.root_volume_type
  volume_size                 = var.root_volume_size
  security_group_name         = "${var.name}-security-group-arc"
  associate_public_ip_address = var.associate_public_ip

  tags = var.tags
}
