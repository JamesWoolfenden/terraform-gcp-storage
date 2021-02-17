module "store" {
  source           = "../../"
  common_tags      = var.common_tags
  bucket_name      = "guff"
  project          = var.project
  location         = var.location
  binding_role     = "roles/storage.objectViewer"
  binding_members  = [""]
  log_bucket       = ""
  force_destroy    = true
  retention_period = var.retention_period
}
