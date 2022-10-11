resource "aws_s3_bucket" "s3_bucket" {
  bucket = "mybucket09lenna"
  acl    = "private"
  tags = {
    Name        = "mybucket09lenna"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::mybucket09lenna/*"
      
    }
  ]
}
POLICY
}
