resource "kubernetes_namespace" "namespace" {
for_each = var.namespaces

  metadata {
    annotations = {
      for k, v in each.value.annotations : k => v
    }

    labels = {
      for k, v in each.value.labels : k => v
    }

    name = each.key
  }
}
