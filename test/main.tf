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
  name = "usman"
}

#data "env0_ssh_key" "my_key" {
#  name = "Secret Key"
#}

resource "env0_template" "usman_template" {
  name                = "usman-template"
  description         = "usman-template"
  repository          = "https://github.com/env0/templates"
  path                = "aws/hello-world"
  type                = "terraform"
  terraform_version   = "1.5.7"
}

resource "env0_environment" "usman_provider_example" {
  name        = "test-env-provider"
  project_id  = data.env0_project.default_project.id
  template_id = env0_template.usman_template.id

  configuration {
    name = "test-var1"
    value = "test-value1"
    type = "terraform"
    is_read_only = true
    is_required = true
  }

  configuration {
    name = "test-var2"
    value = "test-value2"
    type = "terraform"
    is_read_only = true
    is_required = true
  }
}

#resource "env0_template_project_assignment" "assignment" {
#  template_id = env0_template.example.id
#  project_id  = data.env0_project.default_project.id
#}

output "template_id" {
    value = env0_template.usman_template.id
}
