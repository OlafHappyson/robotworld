terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "psql" {
  name = "psql"

  build {
      path = "./tobuild"
      dockerfile = "Dockerfile"
  }
}

# Create a container
resource "docker_container" "postgres" {
  image = docker_image.psql.latest
  name  = "postgres"
  restart  = "always"
  ports {
    internal = 8080
    external = 8080
  }

}
