resource "aws_kms_key" "a" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}

resource "aws_kms_key" "b" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation = false
}
