resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block


  tags = merge(var.default_tags, map("Name", "${var.environment}-vpc"))
}
