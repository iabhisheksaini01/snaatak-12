variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
}

variable "remote_state_bucket" {
  description = "S3 bucket for remote state"
  type        = string
}

variable "subnet_state_key" {
  description = "S3 key path to Subnet state file"
  type        = string
}

variable "sg_state_key" {
  description = "S3 key path to Security group state file"
  type        = string
}


variable "instance_type" {
  description = "Instance type"
  type        = string

}

variable "ami_id" {
  description = "scylladb ami id "
  type        = string
}

variable "disk_size" {
  description = "Root volume size (GB)"
  type        = number
}

variable "key_name" {
  description = "PEM key name"
  type        = string
}

