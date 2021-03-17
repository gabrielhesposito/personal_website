resource "aws_s3_bucket" "gespo-dot-me-bucket" {
  bucket = "gespo-dot-me"
  acl    = "private"

  tags = {
    Name        = "gespo-dot-me"
    Environment = "Production"
  }
}
