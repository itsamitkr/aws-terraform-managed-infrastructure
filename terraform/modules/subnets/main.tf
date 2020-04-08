data "aws_caller_identity" "current" {}

resource "aws_subnet" "subnet-private" {
  vpc_id      = var.vpc_id
  cidr_block  = var.private_cidr_block
  tags        = merge(var.default_tags, map("Name", "${var.environment}-subnet-private"))
}

resource "aws_subnet" "subnet-public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr_block
  map_public_ip_on_launch = true
  tags                    = merge(var.default_tags, map("Name", "${var.environment}-subnet-public"))
}
