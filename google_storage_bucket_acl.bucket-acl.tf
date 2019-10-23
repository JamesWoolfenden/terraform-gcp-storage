resource "google_storage_bucket_acl" "bucketacl" {
  count  = var.acl
  bucket = google_storage_bucket.bucket.name

  predefined_acl = "private"
}
