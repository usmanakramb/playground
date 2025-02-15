resource "aws_s3_bucket" "example" {
  bucket = "env0-example-bucket-123"
}

output "bucket_name" {
  value = aws_s3_bucket.example.id
}
