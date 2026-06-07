resource "google_container_cluster" "this" {

  name     = var.cluster_name
  location = var.region
  node_locations = [
    "${var.region}-a",
    "${var.region}-b"
  ]

  network                  = var.network
  subnetwork               = var.subnetwork
  deletion_protection      = false
  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = "VPC_NATIVE"

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {

    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  private_cluster_config {

    enable_private_nodes    = true
    enable_private_endpoint = true

    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {

    cidr_blocks {
      cidr_block   = "10.130.0.0/24"
      display_name = "Management Subnet"
    }
  }
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  enable_shielded_nodes = true

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  vertical_pod_autoscaling {
    enabled = true
  }
}


resource "google_container_node_pool" "system" {

  name     = "system-pool"
  cluster  = google_container_cluster.this.name
  location = var.region

  autoscaling {
    min_node_count = 1
    max_node_count = 2
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {

    machine_type = "e2-medium"
    disk_type    = "pd-ssd"
    disk_size_gb = 20

    service_account = var.node_service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_secure_boot = true
    }

    labels = {
      role = "system"
    }

    tags = [
      "gke-system"
    ]
  }
}

#
#resource "google_container_node_pool" "apps" {
#
# name     = "apps-pool"
# cluster  = google_container_cluster.this.name
# location = var.region
#
# autoscaling {
#   min_node_count = 1
#   max_node_count = 2
# }
#
# management {
#   auto_repair  = true
#   auto_upgrade = true
# }
#
# node_config {
#
#   machine_type = "e2-micro"
#   disk_type    = "pd-ssd"
#   disk_size_gb = 20
#
#   service_account = var.node_service_account
#
#   oauth_scopes = [
#     "https://www.googleapis.com/auth/cloud-platform"
#   ]
#
#   workload_metadata_config {
#     mode = "GKE_METADATA"
#   }
#
#   labels = {
#     role = "apps"
#   }
#
#   tags = [
#     "gke-apps"
#   ]
# }
