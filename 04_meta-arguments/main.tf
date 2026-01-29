resource "aws_s3_bucket" "example_count" {
  count = length(var.s3_bucket_names)

  bucket = var.s3_bucket_names[count.index]

  tags = {
    Name        = var.s3_bucket_names[count.index]
    Environment = var.environment
    Index       = count.index
  }
}

resource "aws_s3_bucket" "example_foreach" {
  for_each = var.s3_bucket_set

  bucket = each.value

  depends_on = [aws_s3_bucket.example_count]

  tags = {
    Name        = each.value
    Environment = var.environment
    BucketType  = "foreach-example"
  }
}