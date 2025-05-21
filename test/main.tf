terraform {
  required_providers {
    env0 = {
      source = "env0/env0"
    }
  }
}

variable "env0_api_key" {
  type    = string
}

variable "env0_api_secret" {
  type    = string
}

provider "env0" {
  api_key    = var.env0_api_key
  api_secret = var.env0_api_secret
}

data "env0_project" "default_project" {
  name = "My Project"
}

data "env0_ssh_key" "my_key" {
  name = "Secret Key"
}

resource "env0_template" "example" {
  name        = "usman template"
  description = "usman template"
  repository  = "https://github.com/env0/templates"
  path        = "aws/hello-world"
  ssh_keys    = [data.env0_ssh_key.my_key]
}

#resource "env0_template_project_assignment" "assignment" {
#  template_id = env0_template.example.id
#  project_id  = data.env0_project.default_project.id
#}
