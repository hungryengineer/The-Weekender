variable "namespaces" {
  type = map(object({
    annotations = map(string)
    labels      = map(string)
  }))
}