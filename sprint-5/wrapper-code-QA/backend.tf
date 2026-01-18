terraform {
  backend "s3" {
    bucket  = "otms-env-qa-cloud-ops-crew"
    key     = "Network_skeleton/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
