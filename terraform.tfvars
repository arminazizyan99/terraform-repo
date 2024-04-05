my-provider = {
  project_name   = "terraform-project-417812"
  project_region = "us-central1"
  project_zone   = "us-central1-b"
}

bucket = {
  name        = "terraform-bucket-"
  location_id = "US"
  class_name  = "STANDARD"
}

test-vm = {
  instance_name     = "terraform-instance"
  instance_type     = "f1-micro"
  availability_zone = "us-central1-b"
  boot_disk_image   = "debian-cloud/debian-11"
  interface_name    = "default"
}


my-account = {

  email  = "terraform-account@terraform-project-417812.iam.gserviceaccount.com"
  scopes = ["https://www.googleapis.com/auth/cloud-platform"]
}
