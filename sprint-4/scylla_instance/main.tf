resource "aws_instance" "scylla" {

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = data.terraform_remote_state.subnet.outputs.subnet_ids["dev-database-subnet"]
  associate_public_ip_address = false

  root_block_device {
    volume_size = var.disk_size
  }

  vpc_security_group_ids = [data.terraform_remote_state.security_group.outputs.scylla_sg_id]

  tags        = local.instance_tags
  
}
