
output "url" {
  description = "The Url of the statebucket"
  value       = google_storage_bucket.bucket.url
}
