variable "heroku_email" {
  default     = "user@mail.com"
  description = "Heroku account email"
}

variable "heroku_api_key" {
  default     = "12345"
  description = "Heroku account API key"
}

variable "heroku_region" {
  default = "us"
  description = "Heroku region"
}

variable "slack_token" {
  default = "xoxb-1234-5678-1234-5678"
  description = "Slack Token"
}
