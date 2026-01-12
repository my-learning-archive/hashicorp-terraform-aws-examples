terraform {
  required_providers {
    # Official provider - AWS
    # https://registry.terraform.io/providers/hashicorp/aws/latest
    # Use the exact version 5.0.0
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.0"
    }

    # Official provider - Azure
    # https://registry.terraform.io/providers/hashicorp/azurerm/latest
    # Use any version except 3.0.0
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "!= 3.0"
    }

    # Official provider - Google Cloud
    # https://registry.terraform.io/providers/hashicorp/google/latest
    # Use any version higher than 4.0.0
    google = {
      source  = "hashicorp/google"
      version = "> 4.0"
    }

    # Official provider - Hashicorp Vault
    # https://registry.terraform.io/providers/hashicorp/vault/latest
    # Use any version lower than 3.0.0
    vault = {
      source  = "hashicorp/vault"
      version = "< 3.0"
    }

    # Partner provider - Cloudflare
    # https://registry.terraform.io/providers/cloudflare/cloudflare/latest
    # Use any minor version higher than 4.52.0
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.52.0"
    }
  }
}
