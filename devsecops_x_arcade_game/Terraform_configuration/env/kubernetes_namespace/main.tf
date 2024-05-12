resource "null_resource" "update_config" {
  provisioner "local-exec" {
  command = "aws eks --region ap-south-1 update-kubeconfig --name arcade-eks"
  }
}

module "kubernetes_namespace" {
    source = "../../mod/kubernetes_namespace"
    namespaces = var.namespaces
    depends_on = [ null_resource.update_config ]
}