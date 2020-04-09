variable "environment" {}

variable "vpc_id" {}

variable "default_tags" {
  default = {
    "application"  = "internet-gateway"
  }
}