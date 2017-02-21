output "heroku URL" {
  value = "${heroku_app.hubot.web_url}"
}

output "heroku_vars" {
  value = "${heroku_app.hubot.all_config_vars}"
}

output "heroku Git URL" {
  value = "${heroku_app.hubot.git_url}"
}
