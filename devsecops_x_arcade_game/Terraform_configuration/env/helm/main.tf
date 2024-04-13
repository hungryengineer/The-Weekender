module "arcade-helm" {
    source     = "../../mod/helm"
    name       = var.name
    repository = var.repository
    chart      = var.chart
    version    = var.version
    namespace  = var.namespace
}