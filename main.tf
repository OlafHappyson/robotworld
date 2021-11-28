
resource "null_resource" "db_setup1" {

  provisioner "local-exec" {

    command = "psql -h localhost -p 63382 -U postgres -f ./sql/world.sql"
    
    environment = {
      PGPASSWORD = "${var.db_password}"
      PGUSER = "${var.db_username}"
    }
  }
}
resource "null_resource" "db_setup2" {

  provisioner "local-exec" {

    command = "psql -h localhost -p 63385  -U postgres -f ./sql/world1.sql"
    
    environment = {
      PGPASSWORD = "${var.db_password}"
      PGUSER = "${var.db_username}"
    }
  }
}
resource "null_resource" "db_setup3" {

  provisioner "local-exec" {

    command = "psql -h localhost -p 63381 -U postgres -f ./sql/world2.sql"
    
    environment = {
      PGPASSWORD = "${var.db_password}"
      PGUSER = "${var.db_username}"
    }
  }
}