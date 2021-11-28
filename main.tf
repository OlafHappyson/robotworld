
resource "null_resource" "db_setup1" {

  provisioner "local-exec" {

    command = "psql -h localhost -p 50537 -U postgres -f ./sql/world.sql"
    
    environment = {
      PGPASSWORD = "${var.db_password}"
      PGUSER = "${var.db_username}"
    }
  }
}
