# ------------------ VPC ------------------
output "vpc_id" {
  description = "VPC ID created by the network module"
  value       = module.network.vpc_id
}

# ------------------ Internet Gateway ------------------
output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = module.network.igw_id
}

# ------------------ NAT Gateway ------------------
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = module.network.nat_gateway_id
}

# ------------------ Public Subnets ------------------
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.network.public_subnet_ids
}

# ------------------ Private Subnets ------------------
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.network.private_subnet_ids
}

# ------------------ Route Tables ------------------
output "public_route_table_id" {
  description = "Public route table ID"
  value       = module.network.public_rt_id
}

output "private_route_table_id" {
  description = "Private route table ID"
  value       = module.network.private_rt_id
}

# ------------------ Security Groups ------------------
output "security_group_ids" {
  description = "Map of Security Group names to IDs"
  value       = module.network.all_sg_ids
}

# ------------------ Application Load Balancer ------------------
output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = module.network.alb_arn
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.network.alb_dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the ALB"
  value       = module.network.alb_zone_id
}

# ------------------ Route53 ------------------
output "route53_record_fqdn" {
  description = "FQDN of the created Route 53 record"
  value       = module.network.route53_record_fqdn
}

# ------------------ Network ACLs ------------------
output "all_nacl_ids" {
  description = "Map of all created NACLs"
  value       = module.network.all_nacl_ids
}

# ------------------ VPC Peering ------------------
output "vpc_peering_connection_id" {
  description = "ID of VPC Peering Connection"
  value       = module.network.vpc_peering_connection_id
}
