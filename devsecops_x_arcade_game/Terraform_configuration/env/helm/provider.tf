terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.13.0"
    }
  }
}

provider "helm" {
 kubernetes {
    config_path = "/c/Users/kumaranshuman/.kube/config" #~/.kube/config"#
    }
}