terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.13.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}

provider "kubernetes" {
    alias                  = "aws"
    host                   = data.terraform_remote_state.arcade-k8s.outputs.eks_endpoint[0][0]
    cluster_ca_certificate = base64decode(data.terraform_remote_state.arcade-k8s.outputs.eks_kubeconfig-certificate-authority-data[0][0][0]["data"])
    # token                  = data.aws_eks_cluster_auth.default.token
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.arcade-k8s.outputs.eks_name[0][0]]
      command     = "aws"
    }
}

provider "helm" {
 kubernetes {
    host                   = data.terraform_remote_state.arcade-k8s.outputs.eks_endpoint[0][0]
    cluster_ca_certificate = base64decode(data.terraform_remote_state.arcade-k8s.outputs.eks_kubeconfig-certificate-authority-data[0][0][0]["data"])
    # token                  = data.aws_eks_cluster_auth.cluster-auth.token

       exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.arcade-k8s.outputs.eks_name[0][0]]
      command     = "aws"
    }
    }
}