variable "project_id" {}
variable "region" {}

variable "network_name" {}

variable "gke_subnet_name" {}
variable "gke_subnet_cidr" {}

variable "pods_range_name" {}
variable "pods_cidr" {}

variable "services_range_name" {}
variable "services_cidr" {}

variable "management_subnet_name" {}
variable "management_subnet_cidr" {}




variable "cluster_name" {
  type = string
}

variable "master_ipv4_cidr_block" {
  type = string
}

variable "node_service_account" {
  type = string
}
