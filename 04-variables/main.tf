
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

variable "region" {
    default = "us-east-1"
}

variable "environment" {
    default = "dev"
    type = string
}

variable "channel_name" {
    default = "general"
    type = string
}

locals {
    bucket_name = "${var.channel_name}-bucket-${var.environment}-${var.region}"
    vpc_name = "${var.environment}-VPC"
    ec2_name = "${var.environment}-EC2"
}

# Create an S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = locals.bucket_name

  tags = {
    Environment = var.environment
    Name        = local.bucket_name
  }
}

# Create a vpc
resource "aws_vpc" "sample_vpc" {
  cidr_block = "10.0.0.0/16"
  region = var.region
  tags = {
    Environment = var.environment
    Name = local.vpc_name
  }
}


# Create ec2 instance 
resource "aws_instance" "sample_instance" {
    instance_type = "t2.micro"
    ami = "ami-0c94855ba95c71c99"
    region = var.region
  tags = {
    Environment = var.environment
    Name = local.ec2_name
  }
}



output "bucket_name" {
    value = aws_s3_bucket.first_bucket.bucket
}


output "vpc_id" {
    value = aws_vpc.sample_vpc.id
}

output "ec2_instance_id" {
    value = aws_instance.sample_instance.id
}
