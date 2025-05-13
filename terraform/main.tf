terraform {
  backend "s3" {
    bucket         = "deepextract-terraform-state-bucket-dev"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
    artifactory = {
      source  = "github.com/deepextractor/artifactory"
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = var.region
}