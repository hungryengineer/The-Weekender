terraform {
  cloud {
    organization = "anshuman-test-org"

    workspaces {
      name = "arcade-network"
    }
  }
}