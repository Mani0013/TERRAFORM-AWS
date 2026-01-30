resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "demo" {
  bucket = "${var.bucket_name}-${random_string.suffix.result}"
  
  tags = {
    Name        = "Lifecycle Demo Bucket"
    # This changes every run - will be ignored
    LastUpdated = timestamp()
    # This might be changed manually
    Description = "Managed by Terraform"
  }

  lifecycle {
    # 1. create_before_destroy
    create_before_destroy = true
    
    # 2. prevent_destroy
    prevent_destroy = false
    
    # 3. ignore_changes
    ignore_changes = [
      tags["LastUpdated"],  # Ignore timestamp
      tags["Description"],  # Ignore if changed manually in AWS Console
    ]
    
    # 4. replace_triggered_by
    replace_triggered_by = [
      random_string.suffix.id
    ]
  }
}