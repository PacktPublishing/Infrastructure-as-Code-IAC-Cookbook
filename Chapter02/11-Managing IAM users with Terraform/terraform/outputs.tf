output "mary" {
  value = "ACCESS_KEY: ${aws_iam_access_key.mary.id}, SECRET: ${aws_iam_access_key.mary.secret}"
}
output "joe" {
  value = "ACCESS_KEY: ${aws_iam_access_key.joe.id}, SECRET: ${aws_iam_access_key.joe.secret}"
}
output "logs" {
  value = "ACCESS_KEY: ${aws_iam_access_key.logs.id}, SECRET: ${aws_iam_access_key.logs.secret}"
}
