terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.39.0"
    }
  }
}

provider "aws" {
#   region  = "ap-south-1"
#   shared_config_files      = ["/c/Users/kumaranshuman/.aws/config"]
#   shared_credentials_files = ["/c/Users/kumaranshuman/.aws/credentials"]
}