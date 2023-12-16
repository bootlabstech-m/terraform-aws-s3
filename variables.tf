variable "no_of_buckets" {
  description = "No of buckets to be created."
  type        = number
}
variable "name" {
  description = "The name of the bucket."
  type        = list(string)
}
variable "region" {
  description = "The region where the bucket is created"
  type        = string
}
variable "role_arn" {
  description = " The ARN of the IAM role"
  type = string
}