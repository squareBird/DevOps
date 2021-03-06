# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name = "Pratice_Internet_Gateway"
    Project = var.project
  }
}

# Public subnet routing table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public_Route_Table"
    Project = var.project
  }
}

# Routaing table assocication
resource "aws_route_table_association" "public_rt_01_asso" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_sub.id
}


//# NAT Gateway EIP
//resource "aws_eip" "nat_eip" {
//  vpc = true
//  tags = {
//    Name = "NAT-EIP"
//    Project = var.project
//  }
//}
//
//# NAT Gateway
//resource "aws_nat_gateway" "nat_gateway" {
//  allocation_id = aws_eip.nat_eip.id
//  subnet_id = aws_subnet.public_sub.id
//  tags = {
//    Name = "Pratice_NAT_Gateway"
//    Project = var.project
//  }
//
//}
//
//# Private subnet routing table
//resource "aws_route_table" "pivate_rt" {
//  vpc_id = aws_vpc.test.id
//
//  route {
//    cidr_block = "0.0.0.0/0"
//    nat_gateway_id = aws_nat_gateway.nat_gateway.id
//  }
//
//  tags = {
//    Name = "Public_Route_Table"
//    Project = var.project
//  }
//}

//# Routaing table assocication
//resource "aws_route_table_association" "private_rt_01_asso" {
//  route_table_id = aws_route_table.pivate_rt.id
//  subnet_id = aws_subnet.private_sub.id
//}
