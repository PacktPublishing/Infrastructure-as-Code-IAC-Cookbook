variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_ssh_admin_key_file" {
  default = "keys/aws_terraform"
}

// https://aws.amazon.com/marketplace/pp/B00O7WM7QW

variable "aws_centos_ami" {
  type = "map"

  default = {
    eu-west-1 = "ami-7abd0209"
    us-east-1 = "ami-6d1c2007"
  }
}

variable "aws_instance_type" {
  default     = "t2.micro"
  description = "Instance Type"
}

variable "chef_version" {
  default = "12.13.37"
}

variable "chef_server_url" {
  default = "https://api.chef.io/organizations/iacbook"
}

variable "chef_validation_client_name" {
  default = "iacbook"
}

variable "ssh_user" {
  default = "centos"
}
