module "kubernetes_namespace" {
    source = "../../mod/kubernetes_namespace"
    namespace = var.namespaces
    depends_on = [ module.arcade-eks-node-group ]
}

module "arcade-helm" {
    source     = "../../mod/helm"
    name             = var.name
    repository       = var.repository
    chart            = var.chart
    chart_version    = var.chart_version
    namespace        = var.namespace
}