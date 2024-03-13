output "rta_id" {
    value = aws_route_table_association.arcade-rta[*].id
}