provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "waf-s3-backend-project" {
  bucket = "waf-s3-backend"
  tags = {
    Environment = "Dev"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "waf-s3-backend-versioning" {
  bucket = aws_s3_bucket.waf-s3-backend-project.id
  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_s3_bucket_server_side_encryption_configuration" "waf-state-file-encryption" {
  bucket = aws_s3_bucket.waf-s3-backend-project.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    blocked_encryption_types = ["SSE-C"]
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.waf-s3-backend-project.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}