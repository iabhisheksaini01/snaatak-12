output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = [for instance in aws_instance.Ec2-Instance : instance.public_ip]
}

output "instance_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = [for instance in aws_instance.Ec2-Instance : instance.private_ip]
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = [for instance in aws_instance.Ec2-Instance : instance.id]
}

output "elastic_ip" {
  description = "Elastic IP of the instance (if created)"
  value       = [for eip in aws_eip.elastic_ip : eip.public_ip]
}

