resource "aws_route_table" "private-route-table" {
  count  = length(var.private_subnets)
  vpc_id = var.vpc_id
  route {
    cidr_block = element(var.private_subnets, count.index)
    gateway_id = element(var.nat_gateway_id, count.index)
  }

  tags = merge(var.default_tags,
  map("Name", "${var.environment}-public-route-table-${element(var.private_subnets, count.index)}"))

}

resource "aws_route_table" "public-route-table" {
  count  = length(var.public_subnets)
  vpc_id = var.vpc_id

  route {
    cidr_block = element(var.public_subnets, count.index)
    gateway_id = var.internet_gateway_id
  }

  tags = merge(var.default_tags,
         map("Name", "${var.environment}-public-route-table-${element(var.public_subnets, count.index)}"))
}
