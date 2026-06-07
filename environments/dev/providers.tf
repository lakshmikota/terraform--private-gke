terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 6.50.0"
    }
  }
}

provider "google" {
  credentials = file("C:/Users/Subbarao K/OneDrive/Desktop/terrafrom-gke/terraform--private-gke/test-project-dev.json")
  project     = var.project_id
  region      = var.region
}
