provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "k8s-namespace" {
  metadata {
    name = var.deployment_namespace
  }
}
