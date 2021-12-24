resource "aws_subnet" "main_public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
    Project = var.project
  }
}

resource "aws_subnet" "main_private_subnet" {
  cidr_block = "10.0.11.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = var.zone2

  tags = {
    Name = "Private Subnet"
    Project = var.project
  }
}