resource "google_storage_bucket_object" "index" {
  name         = "index.yaml"
  source       = "./template/index.yaml"
  bucket       = module.helmrepo.bucket.name
  kms_key_name = var.kms_key_name
  depends_on   = [module.helmrepo, google_kms_crypto_key_iam_member.gcs_cmek]
}
