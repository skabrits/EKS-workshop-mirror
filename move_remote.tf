terraform {
  backend "s3" {
    encrypt 	   = true
    bucket 	   = "<state_bucket>"
    dynamodb_table = "<lock_table>"
    key            = "lock-file/<lock_file>/terraform.tfstate"
    region         = "<region>"
  }
}
