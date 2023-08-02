resource "aws_s3_bucket" "s3bucket" {
  count  = var.no_of_buckets
  bucket = var.bucket_name[count.index]
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id
  versioning_configuration {
    status = var.versioning_enabled
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_acls
  ignore_public_acls      = var.block_public_acls
  restrict_public_buckets = var.block_public_acls
}