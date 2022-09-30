resource "kubernetes_secret" "artifact-registry" {
  metadata {
    name = "artifact-registry"
    namespace = var.app_name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "${var.region}-docker.pkg.dev" = {
          "username" = var.registry_username
          "password" = var.service_account
          "email"    = "${var.service_account_name}@${var.project_id}.iam.gserviceaccount.com"
          "auth"     = base64encode("${var.registry_username}:${var.service_account}")
        }
      }
    })
  }
}
variable "region" {}
variable "app_name" {}
variable "registry_username" {
    default = "_json_key"
}
variable service_account {}
variable project_id {}