output "eks_endpoint" {
  value = aws_eks_cluster.arcade-eks[*].endpoint
}

output "eks_kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.arcade-eks[*].data
}