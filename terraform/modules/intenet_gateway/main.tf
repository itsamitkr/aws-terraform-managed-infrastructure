resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, map("Name", "${var.environment}-internet-gsteway"))
}
