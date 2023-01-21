variable "bucket" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. "
  type        = string

}

variable "region" {
  description = "The region where the bucket is created"
  type        = string

}
variable "enabled" {
  description = "Versioning for the bucket is enabled if set true"
  type        = bool
}
variable "role_arn" {
  description = " The ARN of the IAM role"
  type = string
  
}