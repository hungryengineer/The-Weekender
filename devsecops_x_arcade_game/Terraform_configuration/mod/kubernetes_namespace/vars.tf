variable "namespace" {
  type = map(object({
    annotations = map(string)
    labels      = map(string)
  }))
}