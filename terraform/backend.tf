terraform {
  backend "s3" {
    bucket = "yunplus-terraform"
    key    = "io/yunplus/coder-kit"
    region = "us-east-1"
  }
}
