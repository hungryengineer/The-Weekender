output "aws_eks_node_group_id" {
    value = aws_eks_node_group.arcade_eks_node_group[*].id
}

output "aws_eks_node_group_resources" {
    value = aws_eks_node_group.arcade_eks_node_group[*].resources
}