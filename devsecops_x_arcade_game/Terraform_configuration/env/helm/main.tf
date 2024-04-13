module "arcade-helm" {
    source     = "../../mod/helm"
    name             = var.name
    repository       = var.repository
    chart            = var.chart
    chart_version    = var.chart_version
    namespace        = var.namespace
}