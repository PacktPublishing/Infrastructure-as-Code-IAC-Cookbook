resource "heroku_app" "hubot" {
  name   = "iac-book-hubot"
  region = "${var.heroku_region}"

  config_vars {
    HUBOT_SLACK_TOKEN = "${var.slack_token}"
  }
}

resource "heroku_addon" "redis" {
  app  = "${heroku_app.hubot.name}"
  plan = "heroku-redis:hobby-dev"
}
