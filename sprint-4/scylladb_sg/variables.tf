
variable "ssh_port" {
  description = "Port to allow from Bastion SG"
  type        = number
}

variable "app_port" {
  description = "Application port to allow from ALB SG"
  type        = number
}

variable "egress_cidr" {
  description = "CIDR block to allow for outbound traffic"
  type        = list(string)
}

variable "vpc_state_key" {
  description = "S3 state key path for the VPC remote state"
  type        = string
}

variable "employee_state_key" {
  description = "S3 state key path for  remote state"
  type        = string
}

variable "salary_state_key" {
  description = "S3 state key path for the remote state"
  type        = string
}

variable "state_bucket" {
  description = "Name of the centralized S3 bucket for state"
  type        = string
}

variable "region" {
  description = "Region where the centralized S3 bucket is hosted"
  type        = string
}

