output "arcade_iam_role_arn" {
    value = aws_iam_role.arcade_iam_role[*].arn
}