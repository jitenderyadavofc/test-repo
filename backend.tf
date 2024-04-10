terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "my-birla-org"

    workspaces {
      prefix = "len-infra-"
    }
  }
}