output "full_dns_name" {
  value       = local.full_dns_name
  description = "full dns name of subdomain"
}

output "hosted_zone_id" {
  value       = data.aws_route53_zone.my_zone.id
  description = "id of hosted zone"
}
