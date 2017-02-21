variable "do_token" {
  description = "Digital Ocean Token"
}

variable "ssh_key_file" {
  default     = "keys/iac_admin_sshkey"
  description = "Default SSH Key file"
}

variable "do_region" {
  default     = "ams3"
  description = "Digital Ocean Region"
}

variable "do_droplet_size" {
  default     = "512mb"
  description = "Droplet Size"
}

variable "coreos_channel" {
  default     = "coreos-stable"
  description = "CoreOS Channel"
}

variable "cluster_nodes" {
  default     = "3"
  description = "Number of nodes in the cluster"
}

variable "statuscake_username" {
  default     = "changeme"
  description = "StatusCake Account Username"
}

variable "statuscake_apikey" {
  default     = "hackme"
  description = "StatusCake Account API Key"
}

variable "cluster_domainname" {
  default     = "infrastructure-as-code.com"
  description = "Domain to use"
}
