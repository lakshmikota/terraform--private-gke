module "networking" {

  source = "../../modules/vpc"

  project_id = var.project_id
  region     = var.region

  network_name = var.network_name

  gke_subnet_name = var.gke_subnet_name
  gke_subnet_cidr = var.gke_subnet_cidr

  pods_range_name = var.pods_range_name
  pods_cidr       = var.pods_cidr

  services_range_name = var.services_range_name
  services_cidr       = var.services_cidr

  management_subnet_name = var.management_subnet_name
  management_subnet_cidr = var.management_subnet_cidr
}



module "gke" {

  source = "../../modules/gke"

  project_id = var.project_id
  region     = var.region

  cluster_name = var.cluster_name

  network    = module.networking.network_name
  subnetwork = module.networking.gke_subnet_name

  pods_range_name     = module.networking.pods_range_name
  services_range_name = module.networking.services_range_name

  master_ipv4_cidr_block = var.master_ipv4_cidr_block

  node_service_account = var.node_service_account

  depends_on = [
    module.networking
  ]
}


module "bastion" {

  source = "../../modules/bastion"

  project_id = var.project_id

  region = var.region
  zone   = "${var.region}-a"

  network    = module.networking.network_name
  subnetwork = module.networking.management_subnet_name
}
