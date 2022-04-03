# Public subnet
resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_sub
  vpc_id = aws_vpc.vpc.id

  availability_zone = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet_01"
    Project = var.project
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  cidr_block = var.private_sub
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.zone1

  tags = {
    Name = "Private_Subnet_01"
    Project = var.project
  }
}