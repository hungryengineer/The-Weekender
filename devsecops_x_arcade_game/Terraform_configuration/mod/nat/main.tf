resource "aws_eip" "arcade-eip" {
  domain = "vpc"
  tags   = var.tags
}

resource "aws_nat_gateway" "arcade-nat" {

  allocation_id       = aws_eip.arcade-eip.id
  subnet_id           = var.subnet_id[0]

  tags = var.tags
}