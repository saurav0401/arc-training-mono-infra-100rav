resource "aws_vpc" "vpc_saurav" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-saurav"
    Environment = "ARC-POC"
  }
}

resource "aws_network_acl" "nacl_arc_poc" {
  vpc_id = aws_vpc.vpc_saurav.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name    = "nacl_arc_poc",
    created = "saurav"
  }
}

resource "aws_internet_gateway" "igw_arc_poc" {
  vpc_id = aws_vpc.vpc_saurav.id

  tags = {
    Name = "igw_arc_poc"
  }
}

resource "aws_nat_gateway" "natgw_arc_poc" {
  count         = length(var.public_cidrs)
  allocation_id = element(aws_eip.eip_arc_poc[*].id, count.index)
  subnet_id     = element(aws_subnet.poc_public_subnets[*].id, count.index)

  tags = {
    Name = "poc_natgw-${count.index + 1}"
  }
}

resource "aws_eip" "eip_arc_poc" {
  count  = length(var.public_cidrs)
  domain = "vpc"
}


resource "aws_subnet" "poc_public_subnets" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.vpc_saurav.id
  cidr_block              = element(var.public_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "poc_subnet_public${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets_arc_poc" {
  count             = length(var.private_cidrs)
  vpc_id            = aws_vpc.vpc_saurav.id
  cidr_block        = element(var.private_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = "subnet_private_arc_poc_${count.index + 1}"
  }
}
resource "aws_route_table" "public_rtb_arc_poc" {

  vpc_id = aws_vpc.vpc_saurav.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_arc_poc.id
  }

  tags = {
    Name = "public_rtb_arc_poc"
  }
}
resource "aws_route_table" "poc_private_rtbs" {
  count  = length(var.private_cidrs)
  vpc_id = aws_vpc.vpc_saurav.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.natgw_arc_poc[*].id, count.index)
  }

  tags = {
    Name = "private_rtb_arc_poc_${count.index + 1}"
  }
}


resource "aws_route_table_association" "public_rtb_association_arc_poc" {
  count          = length(var.public_cidrs)
  subnet_id      = element(aws_subnet.poc_public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_rtb_arc_poc.id
}

resource "aws_route_table_association" "private_rtb_association_arc_poc" {
  count          = length(var.private_cidrs)
  subnet_id      = element(aws_subnet.private_subnets_arc_poc[*].id, count.index)
  route_table_id = element(aws_route_table.poc_private_rtbs[*].id, count.index)
}

resource "aws_network_acl_association" "private_nacl_association_arc_poc" {
  count          = length(var.private_cidrs)
  network_acl_id = aws_network_acl.nacl_arc_poc.id
  subnet_id      = element(aws_subnet.private_subnets_arc_poc[*].id, count.index)
}
resource "aws_network_acl_association" "public_nacl_association_arc_poc" {
  count          = length(var.public_cidrs)
  network_acl_id = aws_network_acl.nacl_arc_poc.id
  subnet_id      = element(aws_subnet.poc_public_subnets[*].id, count.index)
}
