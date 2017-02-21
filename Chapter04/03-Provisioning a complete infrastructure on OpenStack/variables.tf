variable "user_name" {
  default     = "changeme"
  description = "OpenStack username"
}

variable "password" {
  default     = "hackme"
  description = "OpenStack password"
}

variable "tenant_name" {
  default     = "123456"
  description = "OpenStack Tenant name"
}

variable "auth_url" {
  default     = "https://openstack.url/v2.0"
  description = "OpenStack Authentication Endpoint"
}

variable "region" {
  default     = "GRA1"
  description = "OpenStack Region"
}

variable "ssh_key_file" {
  default     = "keys/admin_key"
  description = "Default SSH key"
}

variable "allowed_network" {
  default = "1.2.3.4/32"
  description = "The Whitelisted Corporate Network"
}

variable "image_name" {
  default     = "CentOS"
  description = "Default OpenStack image to boot"
}

variable "flavor_name" {
  default     = "some_flavor"
  description = "OpenStack instance flavor"
}

variable "num_runners" {
  default     = "1"
  description = "Number of GitLab CI runners"
}

variable "ssh_username" {
  default     = "ubuntu"
  description = "SSH username"
}
