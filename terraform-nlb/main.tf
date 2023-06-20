provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    encrypt 	   = true
    bucket 	   = "skabrits-bucket"
    dynamodb_table = "skabrits-tf-state-ldb"
    key            = "lock-file/nlb/terraform.tfstate"
    region         = "us-east-1"
  }
}

data "aws_availability_zones" "available" {}
