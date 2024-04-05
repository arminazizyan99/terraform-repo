variable "my-provider" {
  type = object({
    project_name   = string
    project_region = string
    project_zone   = string
  })
}

variable "bucket" {
  description = "Bucket description"
  type = object({
    name        = string
    location_id = string
    class_name  = string
  })
  sensitive = true
}


variable "test-vm" {
  type = object({
    instance_name     = string
    instance_type     = string
    availability_zone = string
    boot_disk_image   = string
    interface_name    = string
  })
}


variable "my-account" {

  type = object({
    email  = string
    scopes = list(string)
  })

  sensitive = true
}


variable "file-text" {
  type    = string
  default = <<EOH
    "Lorem ipsum dolor sit amet. 
    A Anderson psychopath not highfunctioning 
    im do im research do your im.
    A highfunctioning sociopath do psychopath sociopath a research research."
    EOH

  sensitive = true
}
