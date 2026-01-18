# ***************************************************************
#                         Locals
# ***************************************************************

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.env
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}
