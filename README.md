[![Slalom][logo]](https://slalom.com)

# terraform-gcp-storage [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-gcp-storage.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-gcp-storage) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-gcp-storage.svg)](https://github.com/JamesWoolfenden/terraform-gcp-storage/releases/latest)

Creates a GCP storage account.
I created this  module intially to help with making a helm repo.

I had to first create a test repo from the charts folder

```cli
helm serve --repo-path ./charts
```

This gave me a sample index.yaml, which I added as part of the repo creation process [its in the template fodler for the example].

I now have a public helm repo.
https://helm-repo-examplea.storage.googleapis.com/

This has a mininal **index.yaml**

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
  source  = "../../"
  binding     = var.binding
  bucket_name = var.bucket_name
  project     = var.project
  location    = var.location
}
```

## Permissions

I got this error when I was making this project, your service acccount will need the permissions, I added Cloud Storage Admin.

```error
 examplea@examplea.iam.gserviceaccount.com does not have storage.buckets.create access to project XXXXXX, forbidden
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Outputs

| Name | Description |
|------|-------------|
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

Copyright � 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-storage&url=https://github.com/jameswoolfenden/terraform-aws-storage
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-storage&url=https://github.com/jameswoolfenden/terraform-aws-storage
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-storage
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-storage
[share_email]: mailto:?subject=terraform-aws-storage&body=https://github.com/jameswoolfenden/terraform-aws-storage
