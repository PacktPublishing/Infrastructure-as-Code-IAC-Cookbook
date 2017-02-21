resource "aws_s3_bucket" "bucket" {
  bucket = "iacbook-${var.environment}"

  tags {
    Name        = "IAC Book ${var.environment} Bucket"
    Environment = "${var.environment}"
  }
}
