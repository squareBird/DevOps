resource "aws_subnet" "main_public_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = var.public_sub

  tags = {
    Name = "Public Subnet"
    Project = var.project
  }
}

resource "aws_subnet" "main_private_subnet" {
  cidr_block = "10.0.11.0/24"
  vpc_id = aws_vpc.main.id
  availability_zone = var.private_sub

  tags = {
    Name = "Private Subnet"
    Project = var.project
  }
}