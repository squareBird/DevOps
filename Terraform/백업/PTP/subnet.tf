# Public subnet
resource "aws_subnet" "endpoint_subnet" {
  cidr_block = var.endpoint_subnet
  vpc_id = aws_vpc.service_vpc.id

  availability_zone = var.zone1
  map_public_ip_on_launch = true

  tags = {
    Name = "Endpoint_Subnet"
    Project = var.project
  }
}

resource "aws_subnet" "web_subnet" {
  cidr_block = var.web_subnet
  vpc_id = aws_vpc.service_vpc.id

  availability_zone = var.zone2
  map_public_ip_on_launch = true

  tags = {
    Name = "Public_Subnet_02"
    Project = var.project
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet_01" {
  cidr_block = var.private_sub_01
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.zone1

  tags = {
    Name = "Private_Subnet_01"
    Project = var.project
  }
}

resource "aws_subnet" "private_subnet_02" {
  cidr_block = var.private_sub_02
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.zone2

  tags = {
    Name = "Private_Subnet_02"
    Project = var.project
  }
}

resource "aws_subnet" "db_subnet_01" {
  cidr_block = var.db_sub_01
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.zone1

  tags = {
    Name = "DB_Subnet_01"
    Project = var.project
  }
}

# Private Subnet
resource "aws_subnet" "db_subnet_02" {
  cidr_block = var.db_sub_02
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.zone2

  tags = {
    Name = "DB_Subnet_02"
    Project = var.project
  }
}
