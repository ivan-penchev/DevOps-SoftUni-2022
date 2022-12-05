resource "local_file" "config" {
    content  = "<?php\n$database = \"${var.database_name}\";\n$user = \"${var.database_user}\";\n$password  = \"${var.database_passsword}\";\n$host = \"${var.database_host}\";\n?>"
    filename = "${path.module}/config.php"
}