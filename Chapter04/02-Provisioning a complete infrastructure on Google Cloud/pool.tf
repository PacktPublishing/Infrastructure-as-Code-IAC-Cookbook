resource "google_compute_http_health_check" "www" {
  name                = "http"
  request_path        = "/"
  check_interval_sec  = 1
  healthy_threshold   = 1
  unhealthy_threshold = 3
  timeout_sec         = 1
}

resource "google_compute_target_pool" "www" {
  name          = "www-pool"
  instances     = ["${google_compute_instance.www.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.www.name}"]
}
