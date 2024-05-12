resource "terraform_data" "update_config" {
  provisioner "local-exec" {
  command = "aws eks --region ap-south-1 update-kubeconfig --name arcade-eks"
  }
}
resource "terraform_data" "create_namespace" {
  provisioner "local-exec" {
  command = "kubectl create namespace argo"
  }
}
# module "kubernetes_namespace" {
#     source = "../../mod/kubernetes_namespace"
#     namespaces = var.namespaces
#     depends_on = [ null_resource.update_config ]
# }