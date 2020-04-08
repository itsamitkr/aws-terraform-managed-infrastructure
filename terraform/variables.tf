data "aws_region" "current" {}

data "aws_availability_zones" "current" {}

data "aws_caller_identity" "current" {}

variable "account_id" {
  default = "530177017144"
}

variable "environment" {}

variable "default_tags" {
  default = {
    "created_by"  = "Amit Kumar"
    "email"       = "singhakumar.18@gmail.com"
  }
}