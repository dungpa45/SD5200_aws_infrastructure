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
    bucket         = "dungpa-init-terraform"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-init-table"
    profile        = "default"
    encrypt        = true
    # kms_key_id     = "fff758c9-658d-4a49-98c4-3fabf9b7384d"
  }
}
