
resource "null_resource" "db_setup1" {

  provisioner "local-exec" {

    command = "psql -h localhost -p %PORT1% -U postgres -f ./sql/world.sql"
    
    environment = {
      PGPASSWORD = "${var.db_password}"
      PGUSER = "${var.db_username}"
    }
  }
}
