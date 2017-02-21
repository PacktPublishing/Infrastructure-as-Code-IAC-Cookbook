resource "aws_s3_bucket" "tfstate" {
  bucket = "iacbook-tfstate"

  versioning {
    enabled = true
  }

  tags {
    Name = "IAC Book TFState Bucket"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "iacbook-bucket"

  tags {
    Name = "IAC Book Bucket"
  }
}
