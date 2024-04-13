resource "helm_release" "arcade-helm" {
  count      = length(var.chart)
  name       = element(var.name, count.index)
  repository = element(var.repository, count.index) #"https://charts.bitnami.com/bitnami"
  chart      = element(var.chart, count.index) #"redis"
  version    = element(var.chart_version, count.index) #"6.0.1"
  namespace  = var.namespace

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