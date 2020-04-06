variable "account_id" {
  default = "530177017144"
}

variable "default_tags" {
  type = "map"
  default = {
    "created_by"  = "Terraform"
    "environment" = "development"
    "email"       = "singhakumar.18@gmail.com"
  }
}