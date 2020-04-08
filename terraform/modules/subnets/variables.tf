variable "account_id" {}

variable "environment" {}

variable "vpc_id" {}

variable "private_cidr_block" {
  default = "10.0.1.0/24"
}

variable "public_cidr_block" {
  default = "10.0.1.0/24"
}

variable "default_tags" {
  default = {
    "application"  = "subnets"
  }
}