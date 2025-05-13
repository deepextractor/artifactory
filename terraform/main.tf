terraform {
  backend "s3" {
    bucket         = "deepextract-terraform-state-bucket-dev"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}