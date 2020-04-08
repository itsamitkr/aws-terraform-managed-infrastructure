variable "account_id" {}

variable "vpc_id" {}

variable "environment" {}

variable "outbound_cidr_range" {
  default = ["0.0.0.0/0"]
}

variable "inbound_cidr_range_private" {
  default = ["10.0.1.0/24"]
}

variable "inbound_cidr_range_public" {
  default = ["10.0.2.0/24"]
}

variable "default_tags" {
  default = {
    "application"  = "security-groups"
  }
}