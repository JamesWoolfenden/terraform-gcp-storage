resource "google_storage_bucket_acl" "bucketacl" {
  bucket = google_storage_bucket.bucket.name

  predefined_acl = "private"
}
