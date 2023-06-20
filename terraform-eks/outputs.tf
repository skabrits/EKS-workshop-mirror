output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "oidc_arn" {
  description = "OIDC ARN"
  value       = module.eks.oidc_provider_arn
}

output "eks_nodes" {
  description = "Nodes"
  value       = module.eks.eks_managed_node_groups
}

output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "vpc_subnets" {
  description = "VPC subnets"
  value       = module.vpc.public_subnets
}