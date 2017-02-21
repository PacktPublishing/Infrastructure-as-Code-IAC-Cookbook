variable "auth_token" {
  default     = "1234"
  description = "API Key Auth Token"
}

variable "ssh_key" {
  default     = "keys/admin_key"
  description = "Path to SSH key"
}

variable "facility" {
  default     = "ewr1"
  description = "Packet facility (us-east=ewr1, us-west=sjc1, eu-west=ams1)"
}

variable "plan" {
  default     = "baremetal_0"
  description = "Packet machine type"
}

variable "operating_system" {
  default     = "coreos_stable"
  description = "Packet operating_system"
}

variable "ssh_username" {
  default     = "root"
  description = "Default host username"
}

variable "num_nodes" {
  default     = "1"
  description = "Number of Docker Swarm nodes"
}

variable "worker_token_file" {
  default     = "worker.token"
  description = "Worker token file"
}
