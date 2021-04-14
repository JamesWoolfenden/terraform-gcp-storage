resource "google_storage_bucket_iam_binding" "binding" {
  # checkov:skip=CKV_GCP_28
  bucket  = google_storage_bucket.bucket.name
  role    = var.binding_role
  members = var.binding_members
}
