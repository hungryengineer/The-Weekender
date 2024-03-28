# to import network and iam settings
data "terraform_remote_state" "arcade-network" {
  backend = "remote"

  config = {
    organization = "anshuman-test-org"
    workspaces = {
      name = "arcade-network"
    }
  }
}

data "terraform_remote_state" "arcade-iam" {
  backend = "remote"

  config = {
    organization = "anshuman-test-org"
    workspaces = {
      name = "arcade-iam"
    }
  }
}