#  variables (with sensitive values) definition

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Default region for provider"
}

variable "db_pass_1" {
  type        = string
  description = "password for database #1"
  sensitive   = true
}

variable "db_pass_2" {
  type        = string
  description = "password for database #2"
  sensitive   = true
}