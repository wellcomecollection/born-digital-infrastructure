resource "aws_iam_user" "mac_mini" {
  name = "mac_mini"
}

resource "aws_iam_access_key" "mac_mini" {
  user = aws_iam_user.mac_mini.name
}

resource "aws_iam_user_policy" "allow_mac_mini_upload_to_s3" {
  user   = aws_iam_user.mac_mini.name
  policy = data.aws_iam_policy_document.allow_upload_to_s3.json
}
