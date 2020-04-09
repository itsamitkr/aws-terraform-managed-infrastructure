output "subnet-private-out" {
  value = aws_subnet.subnet-private.*.id
}

output "subnet-private-cidr-out" {
  value = aws_subnet.subnet-private.*.cidr_block
}

output "subnet-private-names" {
  value = aws_subnet.subnet-private.*.arn
}

output "subnet-public-out" {
  value = aws_subnet.subnet-public.*.id
}

output "subnet-public-cidr-out" {
  value = aws_subnet.subnet-public.*.cidr_block
}