module "network" {
  source = "git::https://divyamishra-ai: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@github.com/Snaatak-Cloudops-Crew/IAC-Terraform-repo.git//Terraform/Module/Infra/Network-Skeleton?ref=SCRUM-491-abhishek"

  # ---------------- General ----------------
  region       = var.region
  project_name = var.project_name
  env          = var.env
  owner        = var.owner

  # ---------------- VPC ----------------
  vpc_cidr             = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy

  # ---------------- Public Subnets ----------------
  public_subnet_cidrs = var.public_subnet_cidrs
  public_subnet_azs   = var.public_subnet_azs

  # ---------------- Private Subnets ----------------
  private_subnet_cidrs = var.private_subnet_cidrs
  private_subnet_azs   = var.private_subnet_azs

  # ---------------- Routes ----------------
  public_rt_cidr_block  = var.public_rt_cidr_block
  private_rt_cidr_block = var.private_rt_cidr_block

  # ---------------- NAT ----------------
  eip_domain = var.eip_domain

  # ---------------- Security Groups ----------------
  create_sg            = var.create_sg
  sg_names             = var.sg_names
  security_groups_rule = var.security_groups_rule

  # ---------------- NACLs ----------------
  create_nacl = var.create_nacl

  # ---------------- ALB ----------------
  create_alb         = var.create_alb
  alb_name           = var.alb_name
  lb_internal        = var.lb_internal
  lb_type            = var.lb_type
  lb_enable_deletion = var.lb_enable_deletion

  # ---------------- Route53 ----------------
  create_route53_record = var.create_route53_record
  domain_name           = var.domain_name
  subdomain_name        = var.subdomain_name

  # ---------------- Peering ----------------
  enable_vpc_peering   = var.enable_vpc_peering
  peer_vpc_id          = var.peer_vpc_id
  peer_vpc_cidr        = var.peer_vpc_cidr
  peer_route_table_ids = var.peer_route_table_ids

  # ---------------- Tags ----------------
  common_tags = var.common_tags
}
