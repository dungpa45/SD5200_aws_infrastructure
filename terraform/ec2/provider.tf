provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket         = "terraform-boostrap-nashtech-devops-0002"
    key            = "ec2.tfstate"
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
    bucket  = "terraform-boostrap-nashtech-devops-0002"
    key     = "terraform.tfstate"
    profile = "default"
    region  = "ap-southeast-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  workspace = "dev"

  config = {
    bucket  = "terraform-boostrap-nashtech-devops-0002"
    key     = "network.tfstate"
    profile = "default"
    region  = "ap-southeast-1"
  }
}

terraform {
  required_version = "~> 1.3.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
}