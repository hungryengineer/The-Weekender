terraform {
  backend "s3" {
    bucket = "terraform-arcade"
    key    = "network.tfstate"
    region = "ap-south-1"
  }
}