######vpc######
variable "cidr_block" {
  #type = list(string)
}

######subnets######
variable "cidr_block_snet" {
  
}

variable "availability_zone" {
  
}
######route_table#####

variable "destination_cidr_block" {
  
}

# #####for release based deployment/rollback####only for rollback branch
# variable "release_tag" {
#   description = "Tag or version of the release to which you want to roll back"
#   type        = string
# }
