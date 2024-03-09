######vpc######
module "arcade-vpc" {
    source = "../../mod/vpc"
    count = length(var.cidr_block)
    cidr_block = element(var.cidr_block, count.index)
    tags = local.tags
}

######subnets#####

module "arcade-subnet" {
    source          = "../../mod/subnets"
    count           = length(var.cidr_block_snet)
    vpc_id          = module.arcade-vpc[0].vpc_id
    cidr_block_snet = element(var.cidr_block_snet, count.index)
    tags = {
        Name = count.index == 0 ? "private-subnet-${local.tags.Name}" : "public-subnet-${local.tags.Name}"
    }    
    depends_on      = [ module.arcade-vpc ]

}

##########internet gateway########

module "arcade-igw" {
    source          = "../../mod/igw"
    count           = length(var.cidr_block)
    cidr_block      = element(var.cidr_block, count.index)
    vpc_id          = module.arcade-vpc[0].vpc_id
    tags            = local.tags 
    depends_on      = [ module.arcade-vpc ]    
}

##########nat gateway#############

module "arcade-nat" {
    source = "../../mod/nat"

    subnet_id         = module.arcade-subnet[1].subnet_id
    tags              = local.tags
    depends_on        = [ module.arcade-igw ]
        
}