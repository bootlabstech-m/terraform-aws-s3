variable "no_of_buckets" {
  description = "Number of S3 buckets to create"
  type        = number
}

variable "name" {
  description = "List of S3 bucket names"
  type        = list(string)
}

variable "force_destroy" {
  description = "Force destroy buckets (deletes all objects including versions)"
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Whether to enable S3 Object Lock (must be enabled at creation)"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  description = "Enable S3 versioning"
  type        = bool
  default     = true
}

variable "aws_kms_key" {
  description = "KMS key ID or ARN to use for encryption"
  type        = string
}

variable "bucket_key_enabled" {
  description = "Whether to use bucket keys for SSE-KMS"
  type        = bool
  default     = true
}

# Public Access Block
variable "block_public_acls" {
  type    = bool
  default = true
}
variable "block_public_policy" {
  type    = bool
  default = true
}
variable "ignore_public_acls" {
  type    = bool
  default = true
}
variable "restrict_public_buckets" {
  type    = bool
  default = true
}

# Logging
variable "enable_logging" {
  description = "Enable server access logging"
  type        = bool
  default     = false
}

variable "logging_target_bucket" {
  description = "Bucket where logs will be stored"
  type        = string
  default     = ""
}

variable "logging_target_prefix" {
  description = "Prefix for log files"
  type        = string
  default     = "logs/"
}

# Lifecycle Rules
variable "enable_lifecycle_rules" {
  description = "Enable lifecycle rule for objects"
  type        = bool
  default     = false
}

variable "expiration_days" {
  description = "Days after which objects expire"
  type        = number
  default     = 365
}

variable "noncurrent_version_expiration_days" {
  description = "Days to retain non-current versions"
  type        = number
  default     = 30
}
variable "rule_id" {
  description = "Identifier for the lifecycle rule"
  type        = string
  default     = "log-cleanup"
}

variable "rule_status" {
  description = "Status of the lifecycle rule. Acceptable values: Enabled or Disabled"
  type        = string
  default     = "Enabled"
}

variable "abort_multipart_days" {
  description = "Days after which incomplete multipart uploads are aborted"
  type        = number
  default     = 7
}
variable "region" {
  description = "The region where the bucket is created"
  type        = string
}

variable "role_arn" {
  description = " The ARN of the IAM role"
  type = string
}