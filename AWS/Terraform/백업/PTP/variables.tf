variable "accesskey" {
  type = string
}

variable "secretkey" {
  type = string
}

variable "project" {}

# Service Zone CIDR
variable "service_vpc" {}
variable "endpoint_subnet" {}
variable "web_subnet" {}
variable "was_subnet" {}
variable "db_subnet" {}

# Security Zone CIDR
variable "security_vpc" {}
variable "gwlb_subnet" {}
variable "appliance_subnet" {}

# Analysis Zone CIDR
variable "analysis_vpc" {}
variable "analysis_subnet" {}

# 가용영역 a,c 정의
variable "zone1" {}
variable "zone2" {}

# Resource variables
variable "amazon_linux" {}
variable "ubuntu2004" {}