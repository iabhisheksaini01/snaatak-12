
# ****************************************stand-alone-ec2***********************************

resource "aws_instance" "Ec2-Instance" {
  count           = var.number_of_instances
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  #private_ip      = var.private_ip
  associate_public_ip_address = false

 ebs_block_device {
    device_name           = var.device_name
    volume_size           = var.ebs_volume_size
    volume_type           = var.ebs_volume_type
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = local.tag_name
    Owner = var.owner_name
  }
}



# ****************************************Elastic IP***********************************

resource "aws_eip" "elastic_ip" {
  count  = var.allocate_eip ? var.number_of_instances : 0
  domain = var.eip_domain

  instance = aws_instance.Ec2-Instance[count.index].id

  tags = {
    Name  = "${local.tag_name}-eip"
    Owner = var.owner_name
  }
}

