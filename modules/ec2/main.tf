module network {
  source = "../network"
}
resource "aws_instance" "ec2_instance" {

  ami                         = var.ami
  availability_zone           = "${var.aws_region}a"
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.my_key_pair.key_name
  monitoring                  = false
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.instance_security_group.id]
  tenancy                     = "default"
  subnet_id                   = var.subnet_id
  tags = {

    Name = var.name

  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    iops                  = 4000
    throughput            = 125
    volume_size           = 30
    volume_type           = "gp3"
  }

}

resource "tls_private_key" "private_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_pair
  public_key = tls_private_key.private_ssh_key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.private_ssh_key.private_key_pem}' > ../${var.key_pair}.pem"
  }
}
resource "aws_security_group" "instance_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = module.network.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}
