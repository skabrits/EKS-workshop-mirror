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


variable "cluster_vpc" {
  description = "Cluster VPC"
  type        = string
  default     = "None"
}

variable "subnets" {
  description = "Cluster VPC"
  type        = list(string)
  default     = ["None"]
}

variable "user_num" {
  description = "User number"
  type        = number
  default     = 1
}

variable "project_name" {
  description = "Used for generating cluster name"
  type        = string
  default     = "default"
}