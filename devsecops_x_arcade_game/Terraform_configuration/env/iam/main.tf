########iam roles##########
module "arcade-eks-iam-role" {
    source = "../../mod/iam_roles"
    role_name = var.role_name[0]
    assume_role_policy_file = jsonencode(jsondecode(file("./eks_assume_role_policy.json")))
    
}

module "arcade-eks-node-group-iam-role" {
    source = "../../mod/iam_roles"
    role_name = var.role_name[1]
    assume_role_policy_file = jsonencode(jsondecode(file("./node_group_assume_role_policy.json")))
    
}

########iam role policy attachment##########

module "arcade-eks-clusterpolicy-iam-role-attachment" {
    source = "../../mod/iam_role_policy_attachment"
    policy_arn = var.policy_arn[0]
    role = var.role_name[0]  
    depends_on = [ module.arcade-eks-iam-role ]
}

module "arcade-eks-node-group-iam-role-policy-attachment" {
    source = "../../mod/iam_role_policy_attachment"
    policy_arn = var.policy_arn[1]
    role = var.role_name[1] 
    depends_on = [ module.arcade-eks-node-group-iam-role ] 
}
