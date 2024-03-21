output "eks_endpoint" {
  value = module.arcade-eks[*].eks_endpoint
}

output "eks_kubeconfig-certificate-authority-data" {
  value = module.arcade-eks[*].eks_kubeconfig-certificate-authority-data
}