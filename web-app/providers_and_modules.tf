# list of providers

provider "aws" {
  region = var.region
}

module "web_app_1" {
  source = "../web-app-module"

  # Input variables (instead of "terraform.tfvars" 
  # file in the previous configuration)
  app_name          = "web-app-1"
  bucket_prefix     = "devops-web-app-1-data"
  create_dns_record = true
  subdomain         = var.subdomain_1
  domain            = var.domain
  db_name           = "webapp1db"
  db_pass           = var.db_pass_1
  db_user           = "foo"
  environment_name  = var.environment_name_1
  instance_ami      = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type     = "t2.micro"
  certificate_arn   = module.acm.acm_certificate_arn //var.certificate_arn
}

module "web_app_2" {
  source = "../web-app-module"

  # Input variables (instead of "terraform.tfvars" 
  # file in the previous configuration)
  app_name          = "web-app-2"
  bucket_prefix     = "devops-web-app-2-data"
  create_dns_record = true
  subdomain         = var.subdomain_2
  domain            = var.domain
  db_name           = "webapp2db"
  db_pass           = var.db_pass_2
  db_user           = "foo"
  environment_name  = var.environment_name_2
  instance_ami      = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type     = "t2.micro"
  certificate_arn   = module.acm.acm_certificate_arn //var.certificate_arn
}

# locals {
#   prefix_of_subdomain_1 = var.environment_name_1 == "production" ? "" : "${var.environment_name_1}."
#   prefix_of_subdomain_2 = var.environment_name_2 == "production" ? "" : "${var.environment_name_2}."
# }

# Module to create and validate the AWS certificate
module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.3.2"

  domain_name = var.domain
  zone_id     = module.web_app_1.hosted_zone_id

  subject_alternative_names = [
    "*.${var.domain}",
    "${module.web_app_1.full_dns_name}",
    "${module.web_app_2.full_dns_name}",
  ]

  wait_for_validation = true

  tags = {
    Name = "${var.domain}"
  }
}