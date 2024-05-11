# module "kubernetes_namespace" {
#     source = "../../mod/kubernetes_namespace"
#     namespaces = var.namespaces
# }
# resource "null_resource" "cluster" {
#   provisioner "local-exec" {
#     command = "bootstrap-cluster.sh"
    
#   }
# }

module "arcade-helm" {
    
    source     = "../../mod/helm"
    name             = var.name
    repository       = var.repository
    chart            = var.chart
    chart_version    = var.chart_version
    namespace        = var.namespace
}