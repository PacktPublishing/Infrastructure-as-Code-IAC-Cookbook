variable "project_name" {
  default     = "default-project"
  description = "Project ID to use"
}

variable "region" {
  default     = "europe-west"
  description = "Region name"
}

variable "zone" {
  default     = "c"
  description = "Region Zone"
}

variable "credentials_file" {
  default     = "account.json"
  description = "API credentials JSON file"
}

variable "machine_type" {
  default     = "f1-micro"
  description = "Machine type"
}

variable "disk_image" {
  default     = "centos-cloud/centos-7"
  description = "Disk image"
}

variable "ssh_key" {
  default     = "keys/admin_key"
  description = "SSH key"
}

variable "ssh_username" {
  default     = "root"
  description = "The SSH username to use"
}

variable "www_servers" {
  default = "2"
  description = "Amount of www servers"
}

variable "db_type" {
  default     = "D0"
  description = "Google SQL DB type"
}

variable "db_authorized_network" {
  default     = "0.0.0.0/0"
  description = "A corporate network authorized to access the DB"
}

variable "db_username" {
  default     = "dbadmin"
  description = "A MySQL username"
}

variable "db_password" {
  default     = "changeme"
  description = "A MySQL password"
}

variable "db_name" {
  default     = "db_name"
  description = "MySQL database name"
}
