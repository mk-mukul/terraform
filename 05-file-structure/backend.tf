terraform {
  backend "s3" {
    bucket = "mytfbucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}