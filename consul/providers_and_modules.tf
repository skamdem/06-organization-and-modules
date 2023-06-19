provider "aws" {
  region = var.region
}

module "consul" {
  source = "git@github.com:hashicorp/terraform-aws-consul.git"
}