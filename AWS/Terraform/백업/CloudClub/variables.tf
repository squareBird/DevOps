variable "accesskey" {
  type = string
}

variable "secretkey" {
  type = string
}

variable "project" {}

# Network variables
variable "vpc_cidr" {}
variable "public_sub" {}
variable "private_sub" {}

variable "zone1" {}

# Resource variables
variable "amazon_linux" {}
variable "ubuntu2004" {}