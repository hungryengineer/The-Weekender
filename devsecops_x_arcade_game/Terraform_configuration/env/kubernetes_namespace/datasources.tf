data "terraform_remote_state" "arcade-k8s" {
  backend = "remote"

  config = {
    organization = "anshuman-test-org"
    workspaces = {
      name = "arcade-k8s"
    }
  }
}