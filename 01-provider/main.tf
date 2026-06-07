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

# create a vpc
resource "aws_vpc" "example" {
    cidr_block = "10.0.0.0/16"
}

