module "kubernetes_namespace" {
    source = "../../mod/kubernetes_namespace"
    namespaces = var.namespaces
}