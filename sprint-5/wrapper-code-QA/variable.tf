# ------------------ General ------------------
variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment name (dev/prod/qa)"
  type        = string
}

variable "owner" {
  description = "Owner name"
  type        = string
}

# ------------------ VPC ------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support for VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for VPC"
  type        = bool
}

variable "instance_tenancy" {
  description = "VPC instance tenancy"
  type        = string
}

# ------------------ Subnets ------------------
variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "public_subnet_azs" {
  description = "List of AZs for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_azs" {
  description = "List of AZs for private subnets"
  type        = list(string)
}

# ------------------ Routes ------------------
variable "public_rt_cidr_block" {
  description = "CIDR block for public route"
  type        = string
}

variable "private_rt_cidr_block" {
  description = "CIDR block for private route"
  type        = string
}

# ------------------ NAT ------------------
variable "eip_domain" {
  description = "EIP domain for NAT Gateway"
  type        = string
}

# ------------------ Security Groups ------------------
variable "create_sg" {
  description = "Whether to create security groups"
  type        = bool
}

variable "sg_names" {
  description = "List of security group names"
  type        = list(string)
}

variable "security_groups_rule" {
  description = "Security groups ingress/egress rules"
  type        = any
}

# ------------------ NACL ------------------

variable "create_nacl" {
  type        = bool
  description = "Whether to create Network ACLs"
  default     = false
}

variable "nacl_config" {
  description = "Configuration for NACLs"
  type = map(object({
    ingress_rules = list(object({
      rule_no    = number
      protocol   = string
      action     = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
    egress_rules = list(object({
      rule_no    = number
      protocol   = string
      action     = string
      cidr_block = string
      from_port  = number
      to_port    = number
    }))
  }))
  default = {}
}

variable "nacl_association_map" {
  description = "Mapping of NACLs to subnets"
  type = map(object({
    nacl_name = string
    index     = number
  }))
  default = {}
}


# ------------------ ALB ------------------
variable "create_alb" {
  description = "Whether to create ALB"
  type        = bool
}

variable "alb_name" {
  description = "ALB name"
  type        = string
}

variable "lb_internal" {
  description = "Internal or internet-facing ALB"
  type        = bool
}

variable "lb_type" {
  description = "ALB type"
  type        = string
}

variable "lb_enable_deletion" {
  description = "Enable deletion protection for ALB"
  type        = bool
}

# ------------------ Route53 ------------------
variable "create_route53_record" {
  description = "Whether to create Route53 record"
  type        = bool
}

variable "domain_name" {
  description = "Domain name for Route53"
  type        = string
  default     = null
}

variable "subdomain_name" {
  description = "Subdomain name for Route53 record"
  type        = string
  default     = null
}

variable "zone_id" {
  description = "Route53 hosted zone ID"
  type        = string
  default     = null
}

variable "type" {
  type        = list(string)
  description = "List of route table IDs from peer VPC for return routes"
  default     = []
}


# ------------------ VPC Peering ------------------
variable "enable_vpc_peering" {
  type        = bool
  description = "Enable VPC peering connection"
  default     = false
}

variable "peer_vpc_id" {
  type        = string
  description = "Peer VPC ID"
  default     = null
}

variable "peer_vpc_cidr" {
  type        = string
  description = "Peer VPC CIDR block"
  default     = null
}

variable "peer_route_table_ids" {
  type        = list(string)
  description = "List of route table IDs from peer VPC for return routes"
  default     = []
}

# ------------------ Tags ------------------
variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}
