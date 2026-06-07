project_id = "test-project-dev-498409"

region = "us-central1"

network_name = "dev-vpc"

gke_subnet_name = "dev-gke-subnet"
gke_subnet_cidr = "10.10.0.0/20"

pods_range_name = "dev-pods"
pods_cidr       = "10.20.0.0/16"

services_range_name = "dev-services"
services_cidr       = "10.30.0.0/20"

management_subnet_name = "dev-mgmt"
management_subnet_cidr = "10.40.0.0/24"


cluster_name = "dev-gke"

master_ipv4_cidr_block = "172.16.0.0/28"

node_service_account = "gke-node-sa@test-project-dev-498409.iam.gserviceaccount.com"
