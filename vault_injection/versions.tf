terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.24.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.1"
    }
  }
}

provider "vault" {
  # Configuration options
}