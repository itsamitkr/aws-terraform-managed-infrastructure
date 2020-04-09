resource "aws_nat_gateway" "nat-gateway" {
  count         = length(var.private_subnets)
  allocation_id = element(var.elastic_ips, count.index)
  subnet_id     = element(var.private_subnets, count.index)

  tags = merge(var.default_tags,
         map("Name", "${var.environment}-nat-gateway-${element(var.private_subnets, count.index)}"))
}
