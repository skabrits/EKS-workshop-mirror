variable "main_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "lock_table" {
  description = "Lock table name"
  type        = string
  default     = "skabrits-tf-state-ldb"
}

variable "state_bucket" {
  description = "State bucket name"
  type        = string
  default     = "skabrits-bucket"
}