output "vpc_id_out" {
  value = aws_vpc.vpc.id
}

output "vpc_id_cidr_block" {
  value = [aws_vpc.vpc.cidr_block]
}