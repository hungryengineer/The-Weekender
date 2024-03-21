# to import network and iam settings
data "terraform_remote_state" "arcade" {
  backend = "remote"

  config = {
    organization = "anshuman-test-org"
    workspaces = {
      name = "arcade-workspace"
    }
  }
}