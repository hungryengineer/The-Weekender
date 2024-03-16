resource "aws_vpc" "arcade" {
  count            = length(var.cidr_block)
  cidr_block       = element(var.cidr_block, count.index)
  instance_tenancy = "default"

  tags = var.tags
  lifecycle {
    create_before_destroy = true
  }
}