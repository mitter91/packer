provider "google" {
  credentials = "./artsemiyoursh-day1proj-268813-54c51c38f276.json"
  project     = "artsemiyoursh-day1proj-268813"
  region      = "europe-west4"
}

resource "google_compute_instance" "web-tier" {
  name = "web-tier"
  zone = "europe-west4-b"
  network_interface {
    network = "default"
    access_config {
    }
  }
  machine_type        = "n1-standard-2"
  deletion_protection = "false"
  labels = {
    ansibletype = "punching_bag"
  }

  tags = ["http-server", "https-server"]
  boot_disk {
    initialize_params {
      type  = "pd-ssd"
      image = "centos-packer-yoursh"
      size  = "30"
    }
  }
  lifecycle {
    ignore_changes = [attached_disk]
  }
}

