
data "terraform_remote_state" "subnet" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.subnet_state_key
    region = var.aws_region
  }
}

data "terraform_remote_state" "security_group" {
  backend = "s3"
  config = {
    bucket = var.remote_state_bucket
    key    = var.sg_state_key
    region = var.aws_region
  }
}
