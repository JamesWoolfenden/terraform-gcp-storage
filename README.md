# terraform-gcp-storage

[![Build Status](https://github.com/JamesWoolfenden/terraform-gcp-storage/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-gcp-storage)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-storage.svg)](https://github.com/JamesWoolfenden/terraform-gcp-storage/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-gcp-storage.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-gcp-storage/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-gcp-storage/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-storage&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-storage/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-storage&benchmark=INFRASTRUCTURE+SECURITY)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-gcp-storage/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-gcp-storage&benchmark=CIS+GCP+V1.1)

This creates a GCP storage account.

![alt text](./diagram/gcp_storage.png)

I created this module initially to help with making a Helm repo.

I had to first create a test repo from the charts folder

```cli
helm serve --repo-path ./charts
```

This gave me a sample **index.yaml**, which I added as part of the repo creation process [it's in the template folder for the example].

I now have a public Helm repo.
https://helm-repo-examplea.storage.googleapis.com/

This example has a minimal **index.yaml**

## Adding the repo to your Helm

```cli
helm repo add baby-steps https://helm-repo-examplea.storage.googleapis.com/
"baby-steps" has been added to your repositories
```

Verify:

```cli
$helm repo list
NAME            URL
stable          https://kubernetes-charts.storage.googleapis.com
baby-steps      https://helm-repo-examplea.storage.googleapis.com/
```

## Usage

Add **module.storage.tf** to your code:-

```terraform
module "storage" {
  source        = "JamesWoolfenden/storage/gcp"
  version       = "0.2.3"
  common_tags   = var.common_tags
  binding       = var.binding
  bucket_name   = var.bucket_name
  project       = var.project
  location      = var.location
  log_bucket    = google_storage_bucket.logging.name
  force_destroy = true
}
```

## Permissions

This being GCP you'll get this error when was making this project, your service account will need these permissions, Included in the "Cloud Storage Admin" role.

```error
 examplea@examplea.iam.gserviceaccount.com does not have storage.buckets.create access to project XXXXXX, forbidden
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google_storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) |
| [google_storage_bucket_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_acl) |
| [google_storage_bucket_iam_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | Flag to create and ACL or not, alternative is to use a bucket policy/binding | `number` | `0` | no |
| action\_storage\_class | The target Storage Class of objects affected by this Lifecycle Rule. Supported values include: MULTI\_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE | `string` | `"COLDLINE"` | no |
| action\_type | The type of the action of this Lifecycle Rule. Supported values include: Delete and SetStorageClass | `string` | `"SetStorageClass"` | no |
| binding\_members | n/a | `any` | n/a | yes |
| binding\_role | n/a | `any` | n/a | yes |
| bucket\_name | The name of the bucket | `string` | n/a | yes |
| common\_tags | This is to help you add tags to your cloud objects | `map(any)` | n/a | yes |
| cors | n/a | `map` | <pre>{<br>  "max_age_seconds": null,<br>  "method": [<br>    ""<br>  ],<br>  "origin": [<br>    ""<br>  ],<br>  "response_header": [<br>    ""<br>  ]<br>}</pre> | no |
| force\_destroy | Flag to set to destroy buckets with content | `bool` | `false` | no |
| kms\_key | Which key to encrypt with | `string` | `""` | no |
| lifecycle\_age | Minimum (days) age of an object in days to satisfy this condition | `number` | `3` | no |
| location | Where the bucket is | `string` | `"US"` | no |
| log\_bucket | Should not be itself | `string` | n/a | yes |
| main\_page\_suffix | n/a | `string` | `null` | no |
| not\_found\_page | n/a | `string` | `"404.html"` | no |
| predefined\_acl | n/a | `string` | `"private"` | no |
| project | The GCP projec name | `string` | n/a | yes |
| retention\_period | n/a | `number` | `0` | no |
| versioning | n/a | `map(any)` | <pre>{<br>  "enabled": true<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket | All the bucket info |
| url | The Url of the statebucket |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-storage/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-storage/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-storage&url=https://github.com/jameswoolfenden/terraform-aws-storage
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-storage&url=https://github.com/jameswoolfenden/terraform-aws-storage
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-storage
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-storage
[share_email]: mailto:?subject=terraform-aws-storage&body=https://github.com/jameswoolfenden/terraform-aws-storage
