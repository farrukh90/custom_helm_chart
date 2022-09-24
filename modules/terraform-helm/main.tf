provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
resource "helm_release" "helm_deployment" {
  name      = var.deployment_name
  namespace = var.deployment_namespace
  chart     = var.deployment_path
  wait = false

  values = [
    "${var.values_yaml}"
  ]
}

