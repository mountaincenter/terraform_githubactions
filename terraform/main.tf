resource "aws_s3_bucket" "website" {
  bucket_prefix = "sample"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.website.id}/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  key          = "index.html"
  bucket       = aws_s3_bucket.website.id
  source       = "index.html"
  content_type = "text/html"
}