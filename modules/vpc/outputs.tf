output "network_name" {
  value = google_compute_network.vpc.name
}

output "network_id" {
  value = google_compute_network.vpc.id
}

output "gke_subnet_name" {
  value = google_compute_subnetwork.gke.name
}

output "management_subnet_name" {
  value = google_compute_subnetwork.management.name
}

output "pods_range_name" {
  value = var.pods_range_name
}

output "services_range_name" {
  value = var.services_range_name
}
