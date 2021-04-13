# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    # docker = {
    #   source  = "kreuzwerker/docker"
    #   version = "2.11.0"
    # }

    null = {
      source = "hashicorp/null"
      version = "3.1.0"
    }
  }
}

# provider "docker" {
#   host = "ssh://root@hk.yunplus.io"
# }

# # Create a container
# resource "docker_container" "coder-kit" {
#   image      = docker_image.coder-kit.latest
#   name       = "coder-kit"
#   privileged = true
#   restart    = "always"
#   start      = true
#   ports {
#     internal = 80
#     external = 18080
#   }
# }

# data "docker_registry_image" "coder-kit" {
#   name = "yfsoftcom/coder-kit:latest"
# }

# resource "docker_image" "coder-kit" {
#   name          = data.docker_registry_image.coder-kit.name
#   pull_triggers = [data.docker_registry_image.coder-kit.sha256_digest]
#   force_remove  = true
# }

resource "null_resource" "test" {
  provisioner "remote-exec" {
    inline = [
      "cd /root/projects/coder-kit",
      "git pull",
      "docker pull yfsoftcom/coder-kit",
      "docker stop coder-kit || true && docker rm coder-kit || true",
      "docker run -p 18080:80 --restart=always --name coder-kit -d yfsoftcom/coder-kit",
    ]
    connection {
      host = "hk.yunplus.io"
      user     = "root"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }
}