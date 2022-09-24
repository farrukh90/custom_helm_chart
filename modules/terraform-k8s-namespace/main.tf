resource "kubernetes_namespace" "k8s-namespace" {
  metadata {
    name = var.deployment_namespace
  }
}
output "namespace" {
  value = kubernetes_namespace.k8s-namespace.metadata[0].name
}
