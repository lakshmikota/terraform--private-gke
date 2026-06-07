resource "google_compute_instance" "bastion" {

  name         = "gke-bastion"
  machine_type = var.machine_type
  zone         = var.zone

  tags = [
    "bastion"
  ]

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
      size  = 30
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    # No public IP
  }

  service_account {
    scopes = [
      "cloud-platform"
    ]
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
