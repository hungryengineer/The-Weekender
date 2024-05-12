terraform {
  required_providers {
    
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
    
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# provider "kubernetes" {
#     alias                  = "aws"
#     host                   = data.terraform_remote_state.arcade-k8s.outputs.eks_endpoint[0][0]
#     cluster_ca_certificate = base64decode(data.terraform_remote_state.arcade-k8s.outputs.eks_kubeconfig-certificate-authority-data[0][0][0]["data"])
#     # token                  = data.aws_eks_cluster_auth.default.token
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.arcade-k8s.outputs.eks_name[0][0]]
#       command     = "aws"
#     }
#     # load_config_file       = false

# }