output "ECR" {
  value = "${aws_ecr_repository.myapp.repository_url}"
}
