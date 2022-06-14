# Public subnet
resource "aws_subnet" "sub_01" {
  cidr_block = var.sub_01
  vpc_id = aws_vpc.vpc.id

  availability_zone = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-01"
    Project = var.project
  }
}

# Private Subnet
resource "aws_subnet" "sub_02" {
  cidr_block = var.sub_02
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.zone2

  tags = {
    Name = "Subnet-02"
    Project = var.project
  }
}
