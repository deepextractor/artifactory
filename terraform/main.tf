terraform {
  backend "s3" {
    bucket         = "test-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "component_registry" {
  bucket        = "test-extractor-${var.environment}-${var.region}"
  force_destroy = true
  tags = {
    Name = "test-extractor-${var.environment}-${var.region}"
  }
}