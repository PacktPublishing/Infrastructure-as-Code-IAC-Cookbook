data "docker_registry_image" "ghost" {
  name = "ghost:0.10"
}

data "docker_registry_image" "nginx-proxy" {
  name = "jwilder/nginx-proxy:0.4.0"
}

resource "docker_image" "ghost" {
  name         = "${data.docker_registry_image.ghost.name}"
  pull_trigger = "${data.docker_registry_image.ghost.sha256_digest}"
}

resource "docker_image" "nginx-proxy" {
  name         = "${data.docker_registry_image.nginx-proxy.name}"
  pull_trigger = "${data.docker_registry_image.nginx-proxy.sha256_digest}"
}

resource "docker_container" "ghost" {
  name  = "ghost"
  image = "${docker_image.ghost.latest}"
  env   = ["VIRTUAL_HOST=localhost"]
}

resource "docker_container" "nginx-proxy" {
  name  = "nginx-proxy"
  image = "${docker_image.nginx-proxy.latest}"

  ports {
    internal = 80
    external = 80
    protocol = "tcp"
  }

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/tmp/docker.sock"
    read_only      = true
  }
}
