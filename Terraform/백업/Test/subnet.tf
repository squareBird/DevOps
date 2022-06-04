resource "aws_subnet" "public_sub" {
  cidr_block = var.public_sub
  vpc_id = aws_vpc.test.id
  availability_zone = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "public_sub"
    Project = var.project
  }
}

resource "aws_subnet" "private_sub" {
  cidr_block = var.private_sub
  vpc_id = aws_vpc.test.id
  availability_zone = var.zone1

  tags = {
    Name = "private_sub"
    Project = var.project
  }
}