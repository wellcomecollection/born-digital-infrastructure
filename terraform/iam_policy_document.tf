data "aws_iam_policy_document" "allow_upload_to_s3" {
  statement {
    actions = [
      "s3:PutObject*",
    ]

    resources = [
      aws_s3_bucket.born_digital_transfer.arn,
      "${aws_s3_bucket.born_digital_transfer.arn}/*",
    ]
  }
}