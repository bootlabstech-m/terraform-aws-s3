resource "aws_s3_bucket" "s3bucket" {
  count  = var.no_of_buckets
  bucket = var.bucket_name[count.index]
  versioning {
    enabled = var.enabled
  }
  
}
