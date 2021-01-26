resource "google_storage_bucket_object" "robots" {
  name       = "robots.txt"
  source     = "./template/robots.txt"
  bucket     = var.bucket_name
  depends_on = [module.helmrepo]
}
