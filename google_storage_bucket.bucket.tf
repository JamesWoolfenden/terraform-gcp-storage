resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  project  = var.project

  force_destroy = var.force_destroy

  versioning {
    enabled = var.versioning["enabled"]
  }

  encryption {
    default_kms_key_name = var.kms_key
  }

  uniform_bucket_level_access = true

}
