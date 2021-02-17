module "helmrepo" {
  source          = "../../"
  common_tags     = var.common_tags
  binding_role    = var.binding_role
  binding_members = var.binding_members
  bucket_name     = var.bucket_name
  project         = var.project
  location        = var.location
  log_bucket      = google_storage_bucket.logging.name
  force_destroy   = true
}
