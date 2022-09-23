resource "kubernetes_namespace" "k8s-namespace" {
  metadata {
    name = var.deployment_namespace
  }
}
