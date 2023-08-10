provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket         = "dungpa-terraform-boostrap-nashtech-devops-5200"
    key            = "rds.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-boostrap-nashtech-devops"
    profile        = "default"
    encrypt        = true
    kms_key_id     = "fff758c9-658d-4a49-98c4-3fabf9b7384d"
  }
}

data "terraform_remote_state" "bootstrap" {
  backend = "s3"
  config = {
    bucket  = "dungpa-terraform-boostrap-nashtech-devops-5200"
    key     = "terraform.tfstate"
    profile = "default"
    region  = "ap-southeast-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  workspace = "dev"

  config = {
    bucket  = "dungpa-terraform-boostrap-nashtech-devops-5200"
    key     = "network.tfstate"
    profile = "default"
    region  = "ap-southeast-1"
  }
}

terraform {
  required_version = "~> 1.5.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}