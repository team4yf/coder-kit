    terraform {
      backend "oss" {
        bucket              = "terraform-remote-backend-61d5c353-5348-2e38-9a55-65cf0ef8fef9"
        prefix              = "env:"
        key                 = "prod/terraform.tfstate"
        acl                 = "private"
        region              = "cn-hangzhou"
        encrypt             = "true"
        tablestore_endpoint = "https://yunjia-ots-2.cn-hangzhou.ots.aliyuncs.com"
        tablestore_table    = "terraform_remote_backend_lock_table_61d5c353_5348_2e38_9a55_65cf0ef8fef9"
      }
    }
