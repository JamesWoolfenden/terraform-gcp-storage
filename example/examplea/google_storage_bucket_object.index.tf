resource "google_storage_bucket_object" "index" {
  name       = "index.yaml"
  source     = "./template/index.yaml"
  bucket     = var.bucket_name
  depends_on = [module.helmrepo]
}
