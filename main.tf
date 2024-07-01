resource "aws_s3_bucket" "s3bucket" {
  count  = var.no_of_buckets
  bucket = var.name[count.index]
  lifecycle {
    ignore_changes = [tags]
  }

}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encrption-s3" {
  bucket = aws_s3_bucket.s3bucket[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.aws_kms_key
      sse_algorithm     = "aws:kms"
    }
  }
  
}