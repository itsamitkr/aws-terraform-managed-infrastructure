resource "aws_s3_bucket" "s3-bucket" {
  bucket  = "${var.environment}-s3-bucket"
  acl     = var.acl
  region  = var.region
  policy  = file("./policies/s3_policy.json")

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "archive"
    prefix  = "archive/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA" // "ONEZONE_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

//    noncurrent_version_expiration {
//      days = 90
//    }

  }

  tags    = merge(var.default_tags, map("Name", "${var.environment}-s3-bucket"))
}

