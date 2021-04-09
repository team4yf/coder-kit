# Set the required provider and versions
terraform {
  required_providers {
    # We recommend pinning to the specific version of the Docker Provider you're using
    # since new versions are released frequently
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}

provider "docker" {
  host = "ssh://root@hk.yunplus.io"
}

# Create a container
resource "docker_container" "coder-kit" {
  image      = docker_image.coder-kit.latest
  name       = "coder-kit"
  privileged = true
  restart    = "always"
  start      = true
  ports {
    internal = 80
    external = 18080
  }
}

data "docker_registry_image" "coder-kit" {
  name = "yfsoftcom/coder-kit:latest"
}

resource "docker_image" "coder-kit" {
  name          = data.docker_registry_image.coder-kit.name
  pull_triggers = [data.docker_registry_image.coder-kit.sha256_digest]
  force_remove  = true
}