output "security-group-private-out" {
  value = aws_security_group.security-group-private.id
}

output "security-group-public-out" {
  value = aws_security_group.security-group-public.id
}