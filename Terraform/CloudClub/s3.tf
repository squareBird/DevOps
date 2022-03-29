# S3 Bucket
resource "aws_s3_bucket" "cn-bucket" {
  bucket = "cn-bucket"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.cn-bucket.id
  acl    = "private"
}
