resource "google_storage_bucket_object" "robots" {
  name       = "robots.txt"
  source     = "./template/robots.txt"
  bucket     = module.helmrepo.bucket.name
  depends_on = [module.helmrepo]
}
