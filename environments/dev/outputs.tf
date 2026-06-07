output "network_name" {
  value = module.networking.network_name
}

output "gke_subnet_name" {
  value = module.networking.gke_subnet_name
}

output "management_subnet_name" {
  value = module.networking.management_subnet_name
}
