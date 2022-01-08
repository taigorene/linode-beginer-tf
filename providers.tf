terraform {
  required_providers {
      linode = {
          source = "linode/linode"
      }
  }
}

provider "linode" {
  token = var.linode_token
  api_version = "v4beta"
}