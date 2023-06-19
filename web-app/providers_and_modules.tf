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
  subdomain         = "devops1"
  domain            = "skamdem.dev"
  db_name           = "webapp1db"
  db_pass           = var.db_pass_1
  db_user           = "foo"
  environment_name  = "production"
  instance_ami      = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type     = "t2.micro"
}

module "web_app_2" {
  source = "../web-app-module"

  # Input variables (instead of "terraform.tfvars" 
  # file in the previous configuration)
  app_name          = "web-app-2"
  bucket_prefix     = "devops-web-app-2-data"
  create_dns_record = true
  subdomain         = "devops2"
  domain            = "skamdem.dev"
  db_name           = "webapp2db"
  db_pass           = var.db_pass_2
  db_user           = "foo"
  environment_name  = "production"
  instance_ami      = "ami-053b0d53c279acc90" # Ubuntu 22.04 LTS
  instance_type     = "t2.micro"
}