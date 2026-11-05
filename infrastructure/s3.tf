resource "aws_s3_bucket" "s3-bucket-waf-lab-external-app" {
  bucket = "s3-bucket-waf-lab-external-app"
  tags = {
    Environment = "Dev"
  }

  #   lifecycle {
  #     prevent_destroy = true
  #   }
}




resource "aws_s3_bucket_server_side_encryption_configuration" "waf-state-file-encryption" {
  bucket = aws_s3_bucket.s3-bucket-waf-lab-external-app.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    blocked_encryption_types = ["SSE-C"]
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3-bucket-waf-lab-external-app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}