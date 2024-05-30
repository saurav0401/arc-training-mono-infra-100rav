
# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Public Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr_1
  availability_zone = var.availability_zone_1

  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name_1
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr_2
  availability_zone = var.availability_zone_2

  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnet_name_2
  }
}

# Private Subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidr_1
  availability_zone = var.availability_zone_1

  tags = {
    Name = var.private_subnet_name_1
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidr_2
  availability_zone = var.availability_zone_2

  tags = {
    Name = var.private_subnet_name_2
  }
}

# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# NAT Gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = var.nat_gateway_name
  }
}

resource "aws_eip" "my_eip" {
  vpc = true
}


# Route table associations for both Public & Private Subnets
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}
