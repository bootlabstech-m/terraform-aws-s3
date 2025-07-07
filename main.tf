resource "aws_s3_bucket" "s3bucket" {
  count  = var.no_of_buckets
  bucket = var.name[count.index]
  force_destroy = var.force_destroy
  object_lock_enabled = var.object_lock_enabled

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_s3" {
  count  = var.no_of_buckets
  bucket = aws_s3_bucket.s3bucket[count.index].id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.aws_kms_key
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = var.bucket_key_enabled
  }
}

resource "aws_s3_bucket_logging" "logging" {
  count = var.enable_logging ? var.no_of_buckets : 0
  bucket = aws_s3_bucket.s3bucket[count.index].id
  target_bucket = var.logging_target_bucket
  target_prefix = var.logging_target_prefix
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  count = var.enable_lifecycle_rules ? var.no_of_buckets : 0
  bucket = aws_s3_bucket.s3bucket[count.index].id

  rule {
    id     = var.rule_id
    status = var.rule_status
    expiration {
      days = var.expiration_days
    }

    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = var.abort_multipart_days
    }
  }
}
