output "nat_gatway_ids" {
  value = aws_nat_gateway.nat-gateway.*.id
}
