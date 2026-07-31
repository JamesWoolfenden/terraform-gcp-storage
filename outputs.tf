
output "url" {
  description = "The Url of the statebucket"
  value       = google_storage_bucket.pike.url
}


output "bucket" {
  description = "All the bucket info"
  value       = google_storage_bucket.pike
  sensitive   = true
}
