output "eks_arcade_iam_role_arn" {
    value = module.arcade-eks-iam-role[*].arcade_iam_role_arn
}

output "eks_node_group_arcade_iam_role_arn" {
    value = module.arcade-eks-node-group-iam-role[*].arcade_iam_role_arn
}