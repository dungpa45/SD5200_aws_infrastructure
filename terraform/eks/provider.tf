provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    #args = ["eks", "get-token", "--cluster-name", module.eks.cluster_id]
    args = [
      "--profile",
      "default",
      "--region",
      "ap-southeast-1",
      "eks",
      "get-token",
      "--cluster-name",
      module.eks.cluster_id
    ]
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
  backend "s3" {
    bucket         = "dungpa-terraform-boostrap-nashtech-devops-5200"
    key            = "dev.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-boostrap-nashtech-devops"
    profile        = "default"
    encrypt        = true
    # kms_key_id     = "fff758c9-658d-4a49-98c4-3fabf9b7384d"
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
