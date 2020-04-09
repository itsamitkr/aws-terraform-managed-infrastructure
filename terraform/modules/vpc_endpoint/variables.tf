variable "aws_region" {}

variable "environment" {}

variable "vpc_id" {}

variable "service_prefix" {
  default = "com.amazonaws"
}

variable "default_tags" {
  default = {
    "application"  = "vpc-endpoint"
  }
}