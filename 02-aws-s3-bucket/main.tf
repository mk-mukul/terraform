terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.49.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

# Create an S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "my-unique-bucket-name-1298f29f9283"

  tags = {
    Name        = "My bucket2"
    Environment = "Dev"
  }
}