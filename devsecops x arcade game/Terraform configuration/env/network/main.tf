module "arcade-vpc" {
    source = "../../mod/vpc"
    count = length(var.cidr_block)
    cidr_block = element(var.cidr_block, count.index)
    tags = local.tags
}