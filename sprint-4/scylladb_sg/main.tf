resource "aws_security_group" "scylla_sg" {
  description = "Security group for scylla DB"
  tags        = local.vpc_tags
  vpc_id      = data.terraform_remote_state.dev_vpc.outputs.vpc-id

  ingress {
    description     = "Allow SSH from Bastion_host SG"
    from_port       = var.ssh_port
    to_port         = var.ssh_port
    protocol        = "tcp"
    cidr_blocks = ["10.0.2.0/24"]
  }


  ingress {
    description     = "Allow App Port from employee SG"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [data.terraform_remote_state.employee_sg.outputs.sg_id]
  }

  ingress {
    description     = "Allow App Port from salary SG"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [data.terraform_remote_state.salary_sg.outputs.salary_sg_id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr
  }

}
