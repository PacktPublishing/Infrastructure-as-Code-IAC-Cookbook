variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_ssh_admin_key_file" {
  default = "keys/aws_terraform"
}

variable "aws_coreos_ami" {
  default = "ami-85097ff6"
}

variable "cluster_size" {
  default     = "1"
  description = "Number of nodes in the cluster"
}

variable "aws_instance_type" {
  default     = "t2.micro"
  description = "Instance type"
}
