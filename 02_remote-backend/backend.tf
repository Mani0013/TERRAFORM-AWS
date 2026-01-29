terraform {
  backend "s3" {
    bucket = "remote-backend-practice-md"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}