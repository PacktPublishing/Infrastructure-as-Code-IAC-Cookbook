variable "aws_region" {
  default = "eu-west-1"
}

variable "log_group_name" {
  default = "docker_logs"
}

variable "log_retention_days" {
  default = "7"
}
