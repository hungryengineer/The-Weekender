# resource "kubernetes_namespace" "argo" {
#   metadata {
#     name = "argo"
#   }
# }

resource "helm_release" "arcade-helm" {
  # provisioner "local-exec" {
  #   command = "aws eks --region ap-south-1 update-kubeconfig --name arcade-eks"
  # }
  # provisioner "local-exec" {
  #   command = "bootstrap-cluster.sh"
  # }
  count      = length(var.chart)
  name       = element(var.name, count.index)
  repository = element(var.repository, count.index) #"https://charts.bitnami.com/bitnami"
  chart      = element(var.chart, count.index) #"redis"
  version    = element(var.chart_version, count.index) #"6.0.1"
  namespace  = element(var.namespace, count.index)
  # depends_on = [ kubernetes_namespace.argo ]

#   values = [
#     "${file("values.yaml")}"
#   ]

#   set {
#     name  = "cluster.enabled"
#     value = "true"
#   }

#   set {
#     name  = "metrics.enabled"
#     value = "true"
#   }

}