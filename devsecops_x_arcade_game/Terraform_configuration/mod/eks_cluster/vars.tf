variable "eks_name" {
}

variable "role_arn" {
}

variable "subnet_ids" {
  type = any
}
  
# variable "vpc_config" {
#  type = map(object({
#     subnet_ids = list(string)
#   }))
# }
variable "vpc_config" {
  type = any
}