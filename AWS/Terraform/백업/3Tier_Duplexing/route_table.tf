# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Pratice_Internet_Gateway"
    Project = var.project
  }
}

# NAT Gateway EIP
resource "aws_eip" "nat_eip" {
  vpc = true
  tags = {
    Name = "NAT-EIP"
    Project = var.project
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_subnet_01.id
  tags = {
    Name = "Pratice_NAT_Gateway"
    Project = var.project
  }

}

# Public subnet routing table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public_Route_Table"
    Project = var.project
  }
}

# Private subnet routing table
resource "aws_route_table" "pivate_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "Public_Route_Table"
    Project = var.project
  }
}

resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "DB_Route_Table"
    Project = var.project
  }
}

# Routaing table assocication
resource "aws_route_table_association" "public_rt_01_asso" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet_01.id
}
resource "aws_route_table_association" "public_rt_02_asso" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet_02.id
}

# Routaing table assocication
resource "aws_route_table_association" "private_rt_01_asso" {
  route_table_id = aws_route_table.pivate_rt.id
  subnet_id = aws_subnet.private_subnet_01.id
}

resource "aws_route_table_association" "private_rt_02_asso" {
  route_table_id = aws_route_table.pivate_rt.id
  subnet_id = aws_subnet.private_subnet_02.id
}

# Routaing table assocication
resource "aws_route_table_association" "db_rt_01_asso" {
  route_table_id = aws_route_table.pivate_rt.id
  subnet_id = aws_subnet.db_subnet_01.id
}

resource "aws_route_table_association" "db_rt_02_asso" {
  route_table_id = aws_route_table.pivate_rt.id
  subnet_id = aws_subnet.db_subnet_02.id
}