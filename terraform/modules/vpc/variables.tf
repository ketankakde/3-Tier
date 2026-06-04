variable "vpc_cidr" {
 default = "10.0.0.0/16"
}

variable "vpc_name" {
 default = "3T-ECS-VPC"
}

variable "public_subnet_cidr" {
 default = "10.0.1.0/24"
}

variable "public_subnet_az" {
 default = "us-east-1a"
}

variable "public_subnet_name" {
 default = "3T-ECS-Subnet"
}

variable "igw_name" {
 default = "3T-ECS-IGW"
}
