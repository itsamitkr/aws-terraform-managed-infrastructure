resource "aws_eip" "elastic-ips" {
  count = length(var.private_subnets)
  vpc   = true

  tags = merge(var.default_tags,
         map("Name", "${var.environment}-elastic-ips-${element(var.private_subnets, count.index)}"))
}
