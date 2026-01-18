# ---------------- General ----------------
region       = "ap-southeast-2"
project_name = "OTMS"
env          = "qa"
owner        = "Cloudops-crew"

# ---------------- VPC ----------------
vpc_cidr             = "10.0.0.0/21"
enable_dns_support   = true
enable_dns_hostnames = true
instance_tenancy     = "default"
# ---------------- Public Subnets ----------------
public_subnet_cidrs = ["10.0.0.0/23", "10.0.2.0/23"]
public_subnet_azs   = ["ap-southeast-2a", "ap-southeast-2b"]

# ---------------- Private Subnets ----------------
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
private_subnet_azs   = ["ap-southeast-2b", "ap-southeast-2b", "ap-southeast-2b"]

# ---------------- Routes ----------------
public_rt_cidr_block  = "0.0.0.0/0"
private_rt_cidr_block = "0.0.0.0/0"

# ---------------- NAT ---------------
eip_domain = "vpc"

# ---------------- Security Groups ----------------
create_sg = true

sg_names = [
  "bastion-host",
  "attendance",
  "frontend",
  "redis",
  "alb",
  "scylladb",
  "notification",
  "postgresql",
  "salary",
  "employee"
]

security_groups_rule = {
  "bastion-host" = {
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH access", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "attendance" = {
    ingress_rules = [
      { from_port = 8080, to_port = 8080, protocol = "tcp", description = "From ALB", source_sg_names = ["alb"] },
      { from_port = 22, to_port = 22, protocol = "tcp", description = "From Bastion", source_sg_names = ["bastion-host"] },

    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "frontend" = {
    ingress_rules = [
      { from_port = 3000, to_port = 3000, protocol = "tcp", description = "From ALB", source_sg_names = ["alb"] },
      { from_port = 22, to_port = 22, protocol = "tcp", description = "From Bastion", source_sg_names = ["bastion-host"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "redis" = {
    ingress_rules = [
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "From Salary", source_sg_names = ["salary"] },
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "From Employee", source_sg_names = ["employee"] },
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "From Attendance", source_sg_names = ["attendance"] },
      { from_port = 22, to_port = 22, protocol = "tcp", description = "From Bastion", source_sg_names = ["bastion-host"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "alb" = {
    ingress_rules = [
      { from_port = 80, to_port = 80, protocol = "tcp", description = "HTTP", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443, to_port = 443, protocol = "tcp", description = "HTTPS", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "scylladb" = {
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "SSH from Bastion", source_sg_names = ["bastion-host"] },
      { from_port = 9042, to_port = 9042, protocol = "tcp", description = "From Employee", source_sg_names = ["employee"] },
      { from_port = 9042, to_port = 9042, protocol = "tcp", description = "From Salary", source_sg_names = ["salary"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "notification" = {
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "Admin SSH", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 3000, to_port = 3000, protocol = "tcp", description = "From Frontend", source_sg_names = ["frontend"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "postgresql" = {
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "From Bastion", source_sg_names = ["bastion-host"] },
      { from_port = 5432, to_port = 5432, protocol = "tcp", description = "From Attendance", source_sg_names = ["attendance"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "salary" = {
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "From Bastion", source_sg_names = ["bastion-host"] },
      { from_port = 8080, to_port = 8080, protocol = "tcp", description = "From ALB", source_sg_names = ["alb"] },
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }

  "employee" = {
    ingress_rules = [
      { from_port = 22, to_port = 22, protocol = "tcp", description = "From Bastion", source_sg_names = ["bastion-host"] },
      { from_port = 6379, to_port = 6379, protocol = "tcp", description = "From Redis", source_sg_names = ["redis"] },
      { from_port = 8080, to_port = 8080, protocol = "tcp", description = "From ALB", source_sg_names = ["alb"] }
    ]
    egress_rules = [
      { from_port = 0, to_port = 0, protocol = "-1", description = "Allow all outbound", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
}

# ---------------- NACL ----------------
create_nacl = true

nacl_config = {
  public_nacl = {
    ingress_rules = [
      {
        rule_no    = 100
        protocol   = "tcp"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 80
        to_port    = 80
      },
      {
        rule_no    = 110
        protocol   = "tcp"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 443
        to_port    = 443
      }
    ]
    egress_rules = [
      {
        rule_no    = 100
        protocol   = "-1"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }

  private_nacl = {
    ingress_rules = [
      {
        rule_no    = 100
        protocol   = "tcp"
        action     = "allow"
        cidr_block = "10.0.0.0/16"
        from_port  = 1024
        to_port    = 65535
      }
    ]
    egress_rules = [
      {
        rule_no    = 100
        protocol   = "-1"
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
      }
    ]
  }
}

nacl_association_map = {
  public_subnet_1a = {
    nacl_name = "public_nacl"
    index     = 0
  }
  public_subnet_1b = {
    nacl_name = "public_nacl"
    index     = 1
  }
  private_subnet_1b = {
    nacl_name = "private_nacl"
    index     = 0
  }
}


# ---------------- ALB ----------------
create_alb         = true
alb_name           = "app-alb"
lb_internal        = false
lb_type            = "application"
lb_enable_deletion = false

# ---------------- Route53 ----------------

create_route53_record = false
domain_name           = "cloudopscrew.com"
subdomain_name        = "team"
zone_id               = "Z00597541LPVXKJXJSED3"

# ---------------- Peering ----------------
enable_vpc_peering = false

# ---------------- Tags ----------------
common_tags = {
  Project     = "OTMS"
  Environment = "qa"
  Owner       = "Cloudops-crew"
  ManagedBy   = "Terraform"
}
