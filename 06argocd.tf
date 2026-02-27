resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.8.7"
  namespace        = "argocd"
  create_namespace = true

  cleanup_on_fail = true
  recreate_pods   = true
  replace         = true

  set {
    name  = "server.service.type"
    value = "ClusterIP"
  }

  set {
    name  = "server.ingress.enabled"
    value = "false"
  }

  set {
    name  = "server.insecure"
    value = "false"
  }

  # depends_on = [helm_release.aws-load-balancer-controller]
}
