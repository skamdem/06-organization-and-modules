resource "aws_db_instance" "default" {
  allocated_storage   = 10
  identifier          = var.subdomain
  storage_type        = "standard"
  engine              = "postgres"
  engine_version      = "12"
  instance_class      = "db.t2.micro"
  db_name             = var.db_name
  username            = var.db_user
  password            = var.db_pass
  skip_final_snapshot = true
}