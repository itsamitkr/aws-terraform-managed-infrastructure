variable "environment" {}

variable "private_subnets" {}

variable "default_tags" {
  default = {
    "application"  = "elastic-ip"
  }
}