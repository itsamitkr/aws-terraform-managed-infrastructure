variable "environment" {}

variable "region" {}

variable "acl" {
  default = "private" // "public-read"
}

variable "default_tags" {
  default = {
    "application"  = "s3 Bucket"
  }
}