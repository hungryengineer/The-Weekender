name = ["argo", "istio-base", "istiod", "istio-gw"]
  
repository = ["https://argoproj.github.io/argo-helm","https://istio-release.storage.googleapis.com/charts", "https://istio-release.storage.googleapis.com/charts", "https://istio-release.storage.googleapis.com/charts" ]
  
chart = ["argo-cd", "base", "istiod", "gateway" ]
  
chart_version = ["","","", "", ]

namespace = ["argo", "istio-system", "istio-system", "istio-system"]
