output "region" {
  description = "AWS region"
  value       = var.region
}

output "nlb_dns" {
  description = "NLB DNS"
  value       = module.nlb.lb_dns_name
}