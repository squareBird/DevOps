variable "accesskey" {
  type = string
}

variable "secretkey" {
  type = string
}

variable "project" {}

# Network variables
variable "vpc_cidr" {}
variable "public_sub_01" {}
variable "public_sub_02" {}
variable "private_sub_01" {}
variable "private_sub_02" {}
variable "db_sub_01" {}
variable "db_sub_02" {}

variable "zone1" {}
variable "zone2" {}

# Resource variables
variable "amazon_linux" {}
variable "ubuntu2004" {}