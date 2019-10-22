resource "google_storage_bucket" "bucket" {
  name = var.bucket_name

  versioning {
    enabled = var.versioning["enabled"]
  }
}
