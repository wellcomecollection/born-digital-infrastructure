resource "aws_s3_bucket" "born_digital_transfer" {
  bucket = "wellcomecollection-born-digital-transfer"

  lifecycle_rule {
    id      = "Transition to Infrequent Access"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "Delete old version"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
}
