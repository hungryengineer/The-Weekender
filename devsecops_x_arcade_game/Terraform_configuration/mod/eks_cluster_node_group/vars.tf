variable "node_group_name" {
  
}

variable "eks_name" {
  
}

variable "node_role_arn" {
  
}

variable "subnet_ids" {
  
}

variable "scaling_config" {
  
}

variable "scaling_config" {
  type = map(object({
    desired_size = number
    max_size     = number
    min_size     = number
  }))
  default = {
    "default" = {
      desired_size = 1
      max_size     = 2
      min_size     = 1
    }
  }
}

variable "update_config" {
  type = map(object({
    max_unavailable = number
  }))
  default = {
    "default" = {
      max_unavailable = 1
    }
  }
}



