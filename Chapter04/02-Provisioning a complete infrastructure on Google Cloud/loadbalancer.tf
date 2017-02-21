resource "google_compute_forwarding_rule" "http" {
  name       = "http-lb"
  target     = "${google_compute_target_pool.www.self_link}"
  port_range = "80"
}
