######vpc#######
output "vpc_id" {
  value = module.arcade-vpc[*].vpc_id
}

######subnets######

output "subnet_id" {
  value = module.arcade-subnet[*].subnet_id[*]
}

######igw#######

output "igw_id" {
  value = module.arcade-igw[*].igw_id
}

#######nat######

output "nat_id" {
  value = module.arcade-nat.nat_id

}

########rt########

output "rt_id" {
  value = module.arcade-rt[*].rt_id
}

output "rta_id" {
  value = module.arcade-rta[*].rta_id
} 