terraform {
  backend "s3" {
    bucket = "waf-s3-backend"
    key    = "waf/terraform.tfstate"
    region = "eu-west-3"
  }
}