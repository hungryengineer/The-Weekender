eks_name = [ ["arcade-eks"], ]

node_group_name = [["arcade-eks-node-group"], ]

scaling_config = {
  "config1" = {
    desired_size = 3
    max_size     = 5
    min_size     = 1
  }
}

# scaling_config = true
# desired_size = 1
# max_size = 2
# min_size = 1



# update_config = true
# max_unavailable = 1

update_config = {
  "config1" = {
    max_unavailable = 1
  }
}

vpc_config = {
  "default" = {
    subnet_ids   = []
  }
}
subnet_ids = ["subnet-0bf029d652530abf5","subnet-09504fa17148de1d8",]
