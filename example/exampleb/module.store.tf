# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "store" {
  source          = "../../"
  common_tags     = var.common_tags
  bucket_name     = "guff"
  project         = var.project
  location        = var.location
  binding_role    = "roles/storage.objectViewer"
  binding_members = ["user:james.woolfenden@gmail.com"]
  log_bucket      = ""
  force_destroy   = true
}
