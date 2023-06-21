provider "aws" {
  region     = var.main_region
}

resource "aws_s3_bucket" "lbuck" {
    force_destroy = true
    bucket = var.state_bucket
    acl = "private"
}

resource "aws_dynamodb_table" "ldb" {
  name = var.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}