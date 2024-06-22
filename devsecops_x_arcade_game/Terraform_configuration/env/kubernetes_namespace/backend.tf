terraform {
  cloud {
    organization = "anshuman-test-org"

    workspaces {
      name = "arcade-kubernetes_workspace"
    }
  }
}