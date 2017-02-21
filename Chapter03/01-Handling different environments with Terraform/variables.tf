variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_ssh_admin_key_file" {
  default = "keys/aws_terraform"
}

variable "environment" {
  default     = "staging"
  description = "The environment to run in"
}

// Use: https://coreos.com/os/docs/latest/booting-on-ec2.html

variable "aws_coreos_ami" {
  type = "map"

  default = {
    eu-west-1 = "ami-85097ff6"
    us-east-1 = "ami-0aef8e1d"
  }
}

variable "cluster_size" {
  type = "map"

  default = {
    staging    = "1"
    production = "3"
  }

  description = "Number of nodes in the cluster"
}

variable "aws_instance_type" {
  type = "map"

  default = {
    staging    = "t2.micro"
    production = "t2.medium"
  }

  description = "Instance type"
}
