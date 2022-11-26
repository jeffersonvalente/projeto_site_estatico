terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
    backend "s3" {} #utiliza o s3 para guardar o tflock.state
}


provider "aws" {
  region = "us-east-1"
  profile = "tfsys"
}

#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet
resource "random_pet" "website" {
  length = 5
}
