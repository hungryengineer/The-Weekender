resource "aws_internet_gateway" "arcade-igw" {
  count = length(var.cidr_block)  
  vpc_id = var.vpc_id[0]

  tags = var.tags
}