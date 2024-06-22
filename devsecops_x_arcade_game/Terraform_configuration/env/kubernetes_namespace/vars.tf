variable "namespaces" {
  type = map(object({
    annotations = map(string)
    labels      = map(string)
  }))
  default = {
    argo = {
      annotations = {
        name = "argo"
      }
      labels = {
        mylabel = "argo"
      }
    },
    kong = {
      annotations = {
        name = "kong"
      }
      labels = {
        mylabel = "kong"
      }
    }
  }
}