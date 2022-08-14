resource "aws_s3_bucket" "data" {

  bucket = "${var.app_region}-${var.bucket}"
}
