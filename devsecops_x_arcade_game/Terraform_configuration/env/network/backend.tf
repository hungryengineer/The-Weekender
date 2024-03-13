# terraform {
#   backend "s3" {
#     bucket = "terraform-arcade"
#     key    = "network.tfstate"
#     region = "ap-south-1"
#   }
# }

terraform {
  cloud {
    organization = "anshuman-test-org"

    workspaces {
      name = "arcade-workspace"
    }
  }
}