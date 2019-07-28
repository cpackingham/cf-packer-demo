terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "mgmt" {
  bucket = "mgmt-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = var.tags
}