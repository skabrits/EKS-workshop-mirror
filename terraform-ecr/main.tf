provider "aws" {
  region = var.main_region
}

terraform {
  backend "s3" {
    encrypt 	   = true
    bucket 	   = "skabrits-bucket"
    dynamodb_table = "skabrits-tf-state-ldb"
    key            = "lock-file/ecr/terraform.tfstate"
    region         = "us-east-1"
  }
}