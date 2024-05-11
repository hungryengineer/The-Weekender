module "kubernetes_namespace" {
    source = "../../mod/kubernetes_namespace"
    namespaces = var.namespaces
}

module "arcade-helm" {
    source     = "../../mod/helm"
    name             = var.name
    repository       = var.repository
    chart            = var.chart
    chart_version    = var.chart_version
    namespace        = var.namespace
    depends_on = [ module.kubernetes_namespace ]
}