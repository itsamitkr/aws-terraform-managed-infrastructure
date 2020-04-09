resource "aws_vpc_endpoint" "s3" {
  vpc_id       = var.vpc_id
  service_name = "${var.service_prefix}.${var.aws_region}.s3"

  tags = merge(var.default_tags, map("Name", "${var.environment}-vpc-endpoint-s3"))
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id       = var.vpc_id
  service_name = "${var.service_prefix}.${var.aws_region}.dynamodb"

  tags = merge(var.default_tags, map("Name", "${var.environment}-vpc-endpoint-dynamodb"))
}

