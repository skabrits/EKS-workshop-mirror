variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "main_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Used for generating cluster name"
  type        = string
  default     = "default"
}