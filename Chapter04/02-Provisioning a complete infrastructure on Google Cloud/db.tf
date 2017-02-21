resource "google_sql_database_instance" "master" {
  name             = "sql-master-1"
  region           = "${var.region}"
  database_version = "MYSQL_5_6"

  settings = {
    tier              = "${var.db_type}"
    activation_policy = "ALWAYS"         // vs "ON_DEMAND"
    pricing_plan      = "PER_USE"        // vs "PACKAGE"

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "authorized_network"
        value = "${var.db_authorized_network}"
      }

      authorized_networks {
        name  = "${google_compute_instance.www.0.name}"
        value = "${google_compute_instance.www.0.network_interface.0.access_config.0.assigned_nat_ip}"
      }

      authorized_networks {
        name  = "${google_compute_instance.www.1.name}"
        value = "${google_compute_instance.www.1.network_interface.0.access_config.0.assigned_nat_ip}"
      }
    }
  }
}

// activate the API in https://console.cloud.google.com/apis/library?project=iac-book-infra

resource "google_sql_user" "user_www_1" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "${google_compute_instance.www.0.network_interface.0.access_config.0.assigned_nat_ip}"
}

resource "google_sql_user" "user_www_2" {
  name     = "${var.db_username}"
  password = "${var.db_password}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "${google_compute_instance.www.1.network_interface.0.access_config.0.assigned_nat_ip}"
}

resource "google_sql_database" "db" {
  name     = "${var.db_name}"
  instance = "${google_sql_database_instance.master.name}"
}
