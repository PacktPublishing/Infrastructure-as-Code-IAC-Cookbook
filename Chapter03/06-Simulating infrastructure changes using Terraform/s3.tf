resource "aws_s3_bucket" "bucket" {
  bucket = "iacbook"

  tags {
    Name = "IAC Book Bucket"
  }
}
