terraform {
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "2.17.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "acme" {
  # Configuration options
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

provider "aws" {
  # Configuration options
  region = "eu-west-1"
}

