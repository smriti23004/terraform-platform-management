terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# This pulls the token from the GitHub Secret we just created
variable "github_token" {
  description = "GitHub PAT"
  type        = string
  sensitive   = true
}

provider "github" {
  token = var.github_token
}

# This block tells Terraform to build a new repository
resource "github_repository" "automated_repo" {
  name        = "my-terraform-generated-repo"
  description = "This repository was provisioned entirely by Terraform!"
  visibility  = "public"
  auto_init   = true
}
