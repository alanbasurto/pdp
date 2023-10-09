resource "kubernetes_namespace" "hello-kubernetes-ns"{
    metadata {
        name = "hello-kubernetes-ns"
    }
}

resource "kubernetes_deployment" "helloworld"{
    metadata{
        name      = "helloworld"
        namespace = "hello-kubernetes-ns"
    }
    spec{
        selector{
            match_labels = {
                app = "helloworld"
            }
        }
        replicas = 2
        template {
            metadata {
                labels = {
                    app = "helloworld"
                }
            }
            spec{
                container{
                    name  = "helloworld"
                    image = "paulbouwer/hello-kubernetes:1.5"
                    port{
                        container_port = 8080
                    }
                }
            }
        }
    }
}

resource "kubernetes_service" "hellowsvc" {
  metadata {
    name = "hellowsvc"
    namespace = "hello-kubernetes-ns"
  }
  spec {
    selector = {
      app = "helloworld"
    }
    port {
      port        = 80
      target_port = 8080
      
    }
    type = "NodePort"
  }
}