variable "role_name" {
  type        = list(string)

  
}

variable "assume_role_policies" {
  type = map(string)
  default = {
    eks_role         = "eks_assume_role_policy.json"
    node_groups_role = "node_groups_assume_role_policy.json"
    # Add more roles and policy file paths as needed
  }
}

variable "assume_role_policy_file" {
  
}