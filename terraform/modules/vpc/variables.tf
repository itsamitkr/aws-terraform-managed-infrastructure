variable "environment" {}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  default = "default"
}

variable "default_tags" {
  default = {
    "application"  = "vpc"
  }
}