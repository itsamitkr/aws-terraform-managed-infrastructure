variable "environment" {}

variable "elastic_ips" {}

variable "private_subnets" {}

variable "default_tags" {
  default = {
    "application"  = "nat-gateway"
  }
}