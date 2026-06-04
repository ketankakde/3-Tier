variable "sg_name" {
  default = "3T-ECS-SG"
}

variable "vpc_id" {}

variable "protocol" {
  default = "tcp"
}

variable "ssh_cidr" {
  default = ["0.0.0.0/0"]
}

variable "http_cidr" {
  default = ["0.0.0.0/0"]
}

variable "app_cidr" {
  default = ["0.0.0.0/0"]
}

variable "egress_cidr" {
  default = ["0.0.0.0/0"]
}
