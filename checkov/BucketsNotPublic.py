from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class BucketsNotPublic(BaseResourceCheck):
    def __init__(self):
        name = "Bucket should not be public"
        id = "CKV_GCP_997"
        supported_resources = ['google_storage_bucket_iam_binding']
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        #check members does not contain allUsers
        if 'members' in conf.keys():
            members = conf['members']
            if 'allUsers' in members:
                return CheckResult.FAILED
            else:
                return CheckResult.PASSED
        else:
            return CheckResult.PASSED


check = BucketsNotPublic()
