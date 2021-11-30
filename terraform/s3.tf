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
}
