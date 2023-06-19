# terraform and providers versions
# and backend setup for the root module

terraform {

  # Remote backend specified as S3 bucket
  backend "s3" {
    bucket         = "devops-demos-terraform-state-bucket"
    key            = "06-organization-and-modules/web-app/terraform.tfstate" # Matches repo name.
    region         = "us-east-1"
    dynamodb_table = "devops-demos-tfstate-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.2.0"
    }
  }
}