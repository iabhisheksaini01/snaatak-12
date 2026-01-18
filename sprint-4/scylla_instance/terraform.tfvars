aws_region          = "us-east-2"
remote_state_bucket = "otms-dev-cloud-ops-crew"
subnet_state_key    = "Network_skeleton/Subnets/terraform.tfstate"
sg_state_key        = "Databases/scylladb/SG/terraform.tfstate"
instance_type       = "c7i-flex.large"
ami_id              = "ami-0e6292a858bb12779"
disk_size           = "20"
key_name            = "dev-otms-cloud-ops"


