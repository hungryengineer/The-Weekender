name = ["argo", "istio"]
  
repository = ["https://argoproj.github.io/argo-helm","https://istio-release.storage.googleapis.com/charts", "",  ]
  
chart = ["argo-cd", ["base","istiod"],  ]
  
chart_version = ["","", ]

namespace = ["argo", "istio-system" ]
