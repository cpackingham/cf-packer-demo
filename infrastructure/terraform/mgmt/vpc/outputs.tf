output "mgmt_vpc_id" {
  value = aws_vpc.mgmt.id
}

output "mgmt_main_subnet_id" {
  value = aws_subnet.mgmt_main.id
}

