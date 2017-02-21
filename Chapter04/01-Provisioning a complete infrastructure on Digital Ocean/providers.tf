// Configure Digital Ocean
provider "digitalocean" {
  token = "${var.do_token}"
}

// Configure StatusCake
provider "statuscake" {
  username = "${var.statuscake_username}"
  apikey   = "${var.statuscake_apikey}"
}
