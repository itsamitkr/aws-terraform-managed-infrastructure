variable "environment" {}

variable "vpc_id" {}

variable "internet_gateway_id" {}

variable "nat_gateway_id" {}

variable "public_subnets" {}

variable "private_subnets" {}

variable "default_tags" {
  default = {
    "application"  = "route-table"
  }
}