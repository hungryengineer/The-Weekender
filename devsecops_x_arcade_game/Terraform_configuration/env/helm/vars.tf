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

variable "name" {
  
}
variable "repository" {
  
}
variable "chart" {
  
}
variable "chart_version" {
  
}
variable "namespace" {
  
}