resource "aws_s3_bucket" "s3bucket" {
  bucket = var.bucket
  versioning {
    enabled = var.enabled
  }

}
