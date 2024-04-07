######vpc######
module "arcade-vpc" {
    source = "../../mod/vpc"
    count = length(var.cidr_block)
    cidr_block = element(var.cidr_block, count.index)
    tags = local.tags

}

######subnets#####

module "arcade-subnet" {
    source            = "../../mod/subnets"
    count             = length(var.cidr_block_snet)
    vpc_id            = module.arcade-vpc[0].vpc_id
    cidr_block_snet   = element(var.cidr_block_snet, count.index)
    availability_zone = element(var.availability_zone, count.index)
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
    tags = {
    Name = "igw-${local.tags.Name}"
    Project = "igw-${local.tags.Project}"
    }
    depends_on      = [ module.arcade-vpc, module.arcade-subnet ]    
}

##########nat gateway#############

module "arcade-nat" {
    source = "../../mod/nat"

    subnet_id         = module.arcade-subnet[1].subnet_id
    tags = {
    Name = "nat-${local.tags.Name}"
    Project = "nat-${local.tags.Project}"
    }
    depends_on        = [ module.arcade-vpc, module.arcade-subnet ]
        
}

#########route table##########

module "arcade-rt" {
    source = "../../mod/route_table"

    count           = length(var.cidr_block_snet)
    cidr_block_snet = element(var.cidr_block_snet, count.index)
    destination_cidr_block = element(var.destination_cidr_block, count.index)
    vpc_id          = module.arcade-vpc[0].vpc_id
    gateway_id      = module.arcade-igw[0].igw_id
  tags = {
    Name = "rt-${local.tags.Name}"
    Project = "rt-${local.tags.Project}"
    }
    depends_on        = [ module.arcade-igw ]

}

#########route_table_association######## 
module "arcade-rta" {
    source = "../../mod/route_table_association"

   subnet_id      = flatten(module.arcade-subnet[*].subnet_id)
   route_table_id = flatten(module.arcade-rt[*].rt_id)
  depends_on = [ module.arcade-rt ]
}