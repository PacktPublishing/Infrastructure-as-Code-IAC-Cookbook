output "HTTP Servers" {
  value = "${join(" ", google_compute_instance.www.*.network_interface.0.access_config.0.assigned_nat_ip)}"
}

output "MySQL DB IP" {
  value = "${google_sql_database_instance.master.ip_address.0.ip_address}"
}

output "Load Balancer Public IPv4" {
  value = "${google_compute_forwarding_rule.http.ip_address}"
}

output "DB Credentials" {
  value = "Username=${var.db_username} Password=${var.db_password}"
}
