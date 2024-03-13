output "igw_id" {
  value = aws_internet_gateway.arcade-igw[*].id
}