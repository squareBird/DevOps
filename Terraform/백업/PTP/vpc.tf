# Make vpc
resource "aws_vpc" "service_vpc" {
  cidr_block = var.service_vpc
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Service_VPC"
    Project = var.project
  }
}

resource "aws_vpc" "security_vpc" {
  cidr_block = var.security_vpc
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Security_VPC"
    Project = var.project
  }
}

resource "aws_vpc" "analysis_vpc" {
  cidr_block = var.analysis_vpc
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Analysis_VPC"
    Project = var.project
  }
}

