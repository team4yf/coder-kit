terraform {
  required_version = "~> 0.15"
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "1.103.1"
    }
  }
}
module "remote_state" {
  source                   = "terraform-alicloud-modules/remote-backend/alicloud"
  create_backend_bucket    = true
  create_ots_lock_instance = true
  create_ots_lock_table    = true
  backend_ots_lock_instance = "${var.ots_instance}"
  region                   = "cn-hangzhou"
  state_name               = "prod/terraform.tfstate"
  encrypt_state            =  true
}

provider "alicloud" { }