######vpc#######
output "vpc_id" {
  value = module.arcade-vpc[*].vpc_id
}

######subnets######

output "subnet_id" {
  value = module.arcade-subnet[*].subnet_id
}
