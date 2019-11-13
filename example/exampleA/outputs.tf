output "url" {
  description = "The Url of the statebucket"
  value       = module.helmrepo.url
}

output "bucket" {
  description = "All of the bucket info"
  value       = module.helmrepo.bucket
}
