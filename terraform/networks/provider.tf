provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}

terraform {
  required_version = "~> 1.5.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }

  backend "s3" {
    bucket         = "dungpa-terraform-boostrap-nashtech-devops-5200"
    key            = "network.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-boostrap-nashtech-devops"
    profile        = "default"
    encrypt        = true
    # kms_key_id     = "0649bddf-d19b-4709-a411-2f073472785c"
  }
}
