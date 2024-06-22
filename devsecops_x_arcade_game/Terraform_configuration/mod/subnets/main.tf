resource "aws_subnet" "arcade" {
  count      = length(var.cidr_block_snet)
  vpc_id     = var.vpc_id[count.index]
  cidr_block = element(var.cidr_block_snet, count.index)
  availability_zone = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true


  tags = var.tags
  
}