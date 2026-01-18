terraform {
  backend "s3" {
    bucket         = "otms-dev-cloud-ops-crew"
    key            = "Databases/scylladb/instance/terraform.tfstate"
    region         = "us-east-2"

  }
}
