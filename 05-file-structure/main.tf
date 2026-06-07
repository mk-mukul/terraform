
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

