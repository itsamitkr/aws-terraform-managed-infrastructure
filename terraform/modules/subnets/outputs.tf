output "subnet-private-out" {
  value = aws_subnet.subnet-private.*.id
}

output "subnet-public-out" {
  value = aws_subnet.subnet-public.*.id
}