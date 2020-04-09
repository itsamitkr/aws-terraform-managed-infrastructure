data "aws_region" "current" {}

data "aws_availability_zones" "current" {}

data "aws_caller_identity" "current" {}

variable "account_id" {}

variable "environment" {}

variable "rds_username" {}

variable "rds_password" {}

variable "default_tags" {
  default = {
    "created_by"  = "Amit Kumar"
    "email"       = "singhakumar.18@gmail.com"
  }
}