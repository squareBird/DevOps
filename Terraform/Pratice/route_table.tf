# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "Pratice-Internet_Gateway"
    Project = var.project
  }
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  subnet_id = aws_subnet.main_public_subnet
  tags = {
    Name = "Pratice-NAT_Gateway"
    Project = var.project
  }

}

# Public subnet routing table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public-Route-Table"
    Project = var.project
  }
}

# Private subnet routing table
resource "aws_route_table" "pivate_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main
  }

  tags = {
    Name = "Public-Route_Table"
    Project = var.project
  }
}

# Routaing table assocication
resource "aws_route_table_association" "public_rt_asso" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.main_public_subnet.id
}

# Routaing table assocication
resource "aws_route_table_association" "private_rt_asso" {
  route_table_id = aws_route_table.pivate_rt.id
  subnet_id = aws_subnet.main_private_subnet.id
}