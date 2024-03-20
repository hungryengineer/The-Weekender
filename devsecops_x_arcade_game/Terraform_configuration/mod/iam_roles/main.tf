resource "aws_iam_role" "arcade_iam-role" {
  count = length(var.role_name)
  name  = element(var.role_name, count.index)
  assume_role_policy = var.assume_role_policy_file
}
