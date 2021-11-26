terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
    }
  }

  required_version = ">= 0.13"
}

variable "name" {
  default = "postgres"
}

provider "postgresql" {
  alias           = "database1"
  host            = "127.0.0.1"
  username        = "postgres"
  password        = "12345"
  connect_timeout = "15"
  port            = "5432"
  superuser       = "false"
  sslmode         = "disable"
}

resource "postgresql_database" "my_db1" {
  provider = postgresql.database1
  name     = "my_db1"
}
