provider "aws" {
  access_key = var.accesskey
  secret_key = var.secretkey
}

variable "accesskey" {
  type = String
}

variable "secretkey" {
  type = String
}