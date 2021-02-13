module "helmrepo" {
  source        = "../../"
  common_tags   = var.common_tags
  binding       = var.binding
  bucket_name   = var.bucket_name
  project       = var.project
  location      = var.location
  log_bucket    = google_storage_bucket.logging.name
  force_destroy = true
}
