terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "remote-backend-practice-md"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Create s3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "terraform-practice-s3-manideep-1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}