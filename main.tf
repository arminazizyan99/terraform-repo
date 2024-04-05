terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}


provider "google" {
  project = var.my-provider.project_name
  region  = var.my-provider.project_region
  zone    = var.my-provider.project_zone
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "my-bucket" {
  name          = "${var.bucket.name}${random_id.bucket_suffix.hex}"
  location      = var.bucket.location_id
  storage_class = var.bucket.class_name
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_compute_instance" "test_vm_instance" {
  name         = var.test-vm.instance_name
  machine_type = var.test-vm.instance_type
  zone         = var.test-vm.availability_zone

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.test-vm.boot_disk_image
    }
  }

  network_interface {
    network = var.test-vm.interface_name
    access_config {
    }
  }

  service_account {
    email  = var.my-account.email
    scopes = var.my-account.scopes
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    cat <<EOT > /file.txt
    ${var.file-text}
    EOT

    gcloud storage cp /file.txt gs://${google_storage_bucket.my-bucket.name}/
  EOF

}
