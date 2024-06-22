output "eks_name" {
  value = module.arcade-eks[*].eks_name
}
output "eks_endpoint" {
  value = module.arcade-eks[*].eks_endpoint
}

output "eks_kubeconfig-certificate-authority-data" {
  value = module.arcade-eks[*].eks_kubeconfig-certificate-authority-data
}

output "aws_eks_node_group_id" {
    value = module.arcade-eks-node-group[*].aws_eks_node_group_id
}

output "aws_eks_node_group_resources" {
    value = module.arcade-eks-node-group[*].aws_eks_node_group_resources
}