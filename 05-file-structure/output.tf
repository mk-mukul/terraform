
output "bucket_name" {
    value = aws_s3_bucket.first_bucket.bucket
}


output "vpc_id" {
    value = aws_vpc.sample_vpc.id
}

output "ec2_instance_id" {
    value = aws_instance.sample_instance.id
}
