variable "cluster_name" {
  default = "project-cluster"
}

variable "cluster_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "instance_type" {
  default = "c7i-flex.large"
}

variable "cluster_policy_attachment" {}
