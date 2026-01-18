terraform {
  backend "s3" {
    bucket         = "otms-dev-cloud-ops-crew"
    key            = "Databases/scylladb/SG/terraform.tfstate"
    region         = "us-east-2"
  }
}
