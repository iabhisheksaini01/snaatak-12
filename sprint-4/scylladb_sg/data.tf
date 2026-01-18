data "terraform_remote_state" "dev_vpc" {
  backend = "s3"
  config = {
    bucket = var.state_bucket
    key    = var.vpc_state_key
    region = var.region
  }
}

data "terraform_remote_state" "employee_sg" {
  backend = "s3"
  config = {
    bucket = var.state_bucket
    key    = var.employee_state_key
    region = var.region
  }
}

data "terraform_remote_state" "salary_sg" {
  backend = "s3"
  config = {
    bucket = var.state_bucket
    key    = var.salary_state_key
    region = var.region
  }
}
