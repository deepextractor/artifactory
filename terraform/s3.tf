resource "aws_s3_bucket" "component_registry" {
  bucket        = "test-extractor-${var.environment}-${var.region}"
  force_destroy = true
  tags = {
    name = "test-extractor-${var.environment}-${var.region}",
    accountId = var.account_id
  }
}