resource "google_compute_firewall" "iap_ssh" {

  name    = "allow-iap-ssh"
  network = var.network

  direction = "INGRESS"

  source_ranges = [
    "35.235.240.0/20"
  ]

  target_tags = [
    "bastion"
  ]

  allow {
    protocol = "tcp"
    ports = [
      "22"
    ]
  }
}
