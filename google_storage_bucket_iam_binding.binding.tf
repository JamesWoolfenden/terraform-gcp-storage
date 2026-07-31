resource "google_storage_bucket_iam_binding" "pike" {
  # checkov:skip=CKV_GCP_28
  count   = var.binding_role == "" ? 0 : 1
  bucket  = google_storage_bucket.pike.name
  role    = var.binding_role
  members = var.binding_members
}
