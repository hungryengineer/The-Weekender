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
  lifecycle {
    ignore_changes = [ metadata[0].annotations, metadata[0].labels ]
  }
}
