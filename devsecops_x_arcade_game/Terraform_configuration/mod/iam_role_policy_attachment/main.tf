resource "aws_iam_role_policy_attachment" "arcade-Policy" {
  count      = length(var.policy_arn)
  policy_arn = element(var.policy_arn, count.index)
  role       = element(var.role, count.index)
}