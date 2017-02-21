resource "aws_cloudwatch_log_group" "docker_logs" {
  name              = "${var.log_group_name}"
  retention_in_days = "${var.log_retention_days}"
}
