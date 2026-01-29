# Create s3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "terraform-practice-s3-manideep-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}