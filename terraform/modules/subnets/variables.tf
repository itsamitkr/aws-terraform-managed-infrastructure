variable "account_id" {}

variable "environment" {}

variable "vpc_id" {}

variable "private_cidr_block" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_cidr_block" {
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availabilty_zones" {}

//variable "availabilty_zones" {
//  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
//}

variable "default_tags" {
  default = {
    "application"  = "subnets"
  }
}