variable "vpc_id" {}

variable "environment" {}

variable vpc_security_group_ids {}

variable "db_subnet_group_name" {}

variable "db_username" {}

variable "db_password" {}

variable "db_family" {
  default = "mariadb10.2"
}

variable "db_engine" {
  default = "mariadb"
}

variable "db_version" {
  default = "10.2.21"
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "storage_type" {
  default = "gp2"
}

variable "character_set" {
  default = "utf8"
}

variable "max_allowed_packet" {
  default = 134217728
}

variable "allocated_storage" {
  default = 1 // Size in GB
}

variable "default_tags" {
  default = {
    "application"  = "rds"
  }
}