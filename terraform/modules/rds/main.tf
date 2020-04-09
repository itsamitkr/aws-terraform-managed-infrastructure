resource "aws_db_parameter_group" "default-parameters" {
  name   = "${var.environment}-rds-default-parameters"
  family = var.db_family

  parameter {
    name  = "character_set_server"
    value = var.character_set
  }

  parameter {
    name  = "character_set_client"
    value = var.character_set
  }

  parameter {
    name  = "max_allowed_packet"
    value = var.max_allowed_packet
  }

  tags    = merge(var.default_tags, map("Name", "${var.environment}-rds-default-parameters"))
}

resource "aws_db_instance" "rds-database" {
  count                  = length(var.db_subnet_group_name)
  name                   = "${var.environment}-rds-${element(var.db_subnet_group_name, count.index)}"
  username               = var.db_username
  password               = var.db_password
  allocated_storage      = var.allocated_storage
  multi_az               = true
  engine                 = var.db_engine
  engine_version         = var.db_version
  instance_class         = var.db_instance_class
  vpc_security_group_ids = [var.vpc_security_group_ids]
  db_subnet_group_name   = element(var.db_subnet_group_name, count.index)
  parameter_group_name   = "${var.environment}-rds-default-parameters"

  tags    = merge(var.default_tags, map("Name",
            "${var.environment}-rds-${element(var.db_subnet_group_name, count.index)}"))
}