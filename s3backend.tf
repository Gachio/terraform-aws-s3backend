provider "aws" {
    region = "us-west-2"
}

module "s3backend" {
    source = "github.com/Gachio/terraform-aws-s3backend"
    namespace = "team-ops"
}

output "s3backend_config" {
    value = module.s3backend.config
}