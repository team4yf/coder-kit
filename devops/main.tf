terraform {
}

provider "alicloud" {
  access_key = var.ali_access
  secret_key = var.ali_secret
  region     = var.ali_region
}
# create ali sdk , create ...
# resource name, alias
resource "alicloud_oss_bucket" "bucket-website" {
  # bucket = replace("bucket-website-${var.domain}", ".", "-")
	bucket = "bucket-website-foo2-yunjiaiot-cn"
  acl    = "public-read"
  transfer_acceleration {
    enabled = false
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

# resource "alicloud_dns" "dns" {
#   name = var.domain_name
# }

resource "alicloud_dns_record" "websites" {
  name = var.domain_name
  host_record = "foo2"
  type = "CNAME" 
  value = "${alicloud_oss_bucket.bucket-website.bucket}.${alicloud_oss_bucket.bucket-website.extranet_endpoint}"
}