variable "eks_name" {
}

variable "node_group_name" {
  
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
# variable "scaling_config" {
#   type = bool
# }
# variable "desired_size" {}
# variable "max_size" {}
# variable "min_size" {}


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
# variable "update_config" {
#   type = bool  
# }
# variable "max_unavailable" {}

# variable "vpc_config" {
#  type = map(object({
#     subnet_ids = list(string)
#   }))
# }
variable "vpc_config" {
  type = any
}