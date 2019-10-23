resource "google_storage_bucket_iam_binding" "binding" {
  bucket  = google_storage_bucket.bucket.name
  role    = var.binding["role"]
  members = var.binding["members"]
}
