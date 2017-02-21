output "S3" {
  value = "http://s3-${aws_s3_bucket.iac_book.region}.amazonaws.com/${aws_s3_bucket.iac_book.id}/${aws_s3_bucket_object.index.key}"
}

output "S3 Endpoint" {
  value = "${aws_s3_bucket.iac_book.website_endpoint}"
}
