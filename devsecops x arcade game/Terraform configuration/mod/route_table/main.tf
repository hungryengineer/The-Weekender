resource "aws_route_table" "arcade-rt" {
  count    = length(var.cidr_block_snet)
  vpc_id   = var.vpc_id[0]

  route {
    cidr_block = "0.0.0.0/0" #element(var.cidr_block_snet, count.index)
    gateway_id = var.gateway_id[0]
  }

  tags = var.tags
}
