output "s3_bucket_names_count" {
  description = "Names of S3 buckets created with count"
  value       = aws_s3_bucket.example_count[*].id
}

output "s3_bucket_names_foreach" {
  description = "Names of S3 buckets created with for_each (using for loop)"
  value       = [for bucket in aws_s3_bucket.example_foreach : bucket.id]
}