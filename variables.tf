variable "no_of_buckets" {
  description = "No of buckets to be created."
  type        = number
}
variable "bucket_name" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. "
  type        = list(string)
}

variable "region" {
  description = "The region where the bucket is created"
  type        = string
}
variable "enabled" {
  description = "Versioning for the bucket is enabled if set true (Enabled/Disabled)"
  type        = string
}
variable "role_arn" {
  description = " The ARN of the IAM role"
  type = string
}
variable "block_public_acls" {
  description = "To block all bucket public access"
  type = bool
  default = true
}