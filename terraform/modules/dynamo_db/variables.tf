variable "account_id" {}

variable "environment" {}

variable "billing_mode" {
  default = "PROVISIONED"  // PAY_PER_REQUEST
}

variable "projection_type" {
  default = "INCLUDED"
}

variable "table_hash_key" {
  default = "id"
}

variable "table_range_key" {
  default = "date"
}

variable "gsi_hash_key" {
  default = "date"
}

variable "gsi_projection_type" {
  default = "ALL"
}

variable "read_capacity" {
  default = 1
}

variable "write_capacity" {
  default = 1
}

variable "default_tags" {
  default = {
    "application"  = "dynamo-db"
  }
}