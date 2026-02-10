provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# 1 VPC
data "google_compute_network" "default" {
  name = "default"
}

# 2 allow SSH 
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.vm_name}-allow-ssh"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  # demo only
  source_ranges = ["0.0.0.0/0"]
}

# 3 create VM
resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = data.google_compute_network.default.name

    access_config {
      # assign public IP
    }
  }

  # optional
  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOT

  tags = ["ssh"]
}
