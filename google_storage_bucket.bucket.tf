resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  project  = var.project

  versioning {
    enabled = var.versioning["enabled"]
  }

  encryption {
    default_kms_key_name = var.kms_key
  }
}
variable "kms_key" {
  description = "Which key to encrypt with"
  type        = string

  default = ""
}
