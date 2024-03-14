generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
# Module does not include this required block
terraform {
  backend "s3" {}
} 
provider "aws" {
    region = "ap-southeast-2"
}
EOF
}

remote_state {
    backend = "s3"
    config = {
        bucket = "terragrunt-remote-backend"
        key    = "terraform.tfstate"
        region = "ap-southeast-2"
    }
}
