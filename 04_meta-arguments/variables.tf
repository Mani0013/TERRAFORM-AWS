variable "environment" {
  type        = string
  description = "The environment type"
  default     = "staging"
}

variable "s3_bucket_names" {
  type        = list(string)
  description = "List of S3 bucket names for count example"
  default     = ["tf-count-bucket-a", "tf-count-bucket-b"]
}

variable "s3_bucket_set" {
  type        = set(string)
  description = "Set of S3 bucket names for for_each example"
  default     = ["tf-foreach-bucket-a", "tf-foreach-bucket-b"]
}