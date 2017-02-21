resource "aws_s3_bucket" "iac_book" {
  bucket = "iac-book"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  tags {
    Name = "IAC Book Bucket in ${var.aws_region}"
  }
}

resource "aws_s3_bucket_object" "index" {
    bucket = "${aws_s3_bucket.iac_book.bucket}"
    key = "index.html"
    # source = "index.html"
    content = "<h1>Hello Infrastructure-as-Code Cookbook!</h1>"
    content_type = "text/html"
    acl    = "public-read"
}
