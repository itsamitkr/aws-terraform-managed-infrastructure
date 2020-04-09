output "elastic-ips" {
  value = aws_eip.elastic-ips.*.id
}
