terraform {
  backend "s3" {
    bucket       = "waf-s3-backend" # on place le state dans ce bucket 
    key          = "waf/terraform.tfstate"
    region       = "eu-west-3"
    use_lockfile = true
  }
}