variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key to use for the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

#variable "private_ip" {
#  type = string
#}


variable "env" {
  type        = string
  description = "Environment name"
}

variable "project_name" {
  description = "Project name identifier"
  type        = string
}

variable "instance_name" {
  description = "EC2 instance name label"
  type        = string
}

variable "owner_name" {
  description = "Owner Name"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to deploy resources"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "The security group IDs to associate with the EC2 instance"
  type        = list(string)
  default     = null
}

variable "number_of_instances" {
  description = "Number of instances to create"
  type        = number
}

variable "device_name" {
  type    = string
  default = "/dev/sda1"
}

variable "ebs_volume_size" {
  type    = number
  default = 15
}

variable "ebs_volume_type" {
  type    = string
  default = "gp2"
}

variable "delete_on_termination" {
  type    = bool
  default = true
}

variable "allocate_eip" {
  description = "Whether to allocate and associate an Elastic IP with the instance"
  type        = bool
  default     = false
}

variable "eip_domain" {
  description = "The domain for the Elastic IP (vpc or standard)"
  type        = string
  default     = "vpc"
}

