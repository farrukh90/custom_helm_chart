provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_secret" "artifact-registry" {
  metadata {
    name      = "artifact-registry"
    namespace = var.app_name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.region}-docker.pkg.dev" = {
          "username" = var.registry_username
          "password" = module.service_accounts.key
          "email"    = module.service_accounts.service_account.email
          "auth"     = "${var.registry_username}:${module.service_accounts.key}"
        }
      }
    })
  }
}


module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = var.project_id
  prefix        = ""
  generate_keys = true
  names = [
    var.app_name
  ]
  project_roles = [
    "${var.project_id}=>roles/owner",
  ]
}
variable "region" {}
variable "registry_username" {
  default = "_json_key"
}


variable "project_id" {}


variable "app_name" {}
