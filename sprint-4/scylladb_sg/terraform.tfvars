state_bucket   = "otms-dev-cloud-ops-crew"
region   = "us-east-2"
vpc_state_key  =   "Network_skeleton/VPC/terraform.tfstate"
employee_state_key  = "Applications/Employee-App-Infra/Security-Group/terraform.tfstate"
salary_state_key  = "Applications/Salary-App-Infra/SG/terraform.tfstate"
ssh_port       = 22
app_port       = 9042

egress_cidr = ["0.0.0.0/0"]


