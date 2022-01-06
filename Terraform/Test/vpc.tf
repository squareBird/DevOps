resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "test vpc"
    Project = var.project
  }
}