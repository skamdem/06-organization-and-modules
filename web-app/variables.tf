# variables definition for "web-app" root module

# General variables
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Default region for provider"
}

variable "environment_name_1" {
  type        = string
  default     = "staging"
  description = "Deployment environment (dev/staging/production)"
}

variable "environment_name_2" {
  type        = string
  default     = "staging"
  description = "Deployment environment (dev/staging/production)"
}

# RDS variables (with sensitive values)
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

# Route 53 variables
variable "domain" {
  type        = string
  default     = "skamdem.dev"
  description = "Domain for website."
}

variable "subdomain_1" {
  type        = string
  default     = "devops1"
  description = "Subdomain #1 for website."
}

variable "subdomain_2" {
  type        = string
  default     = "devops2"
  description = "Subdomain #2 for website."
}