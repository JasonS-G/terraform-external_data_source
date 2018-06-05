# Random number generator
resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }

  byte_length = 8
}

# Dummy resource with attributes
resource "null_resource" "Bret" {
  provisioner "local-exec" {
    command = "echo"
    environment = {
      department = "e-markets"
    }
  }
}

# Pulling from a dummy API
data "external" "users" {
  program = [
    "/usr/bin/ruby",
    "${path.module}/scripts/curl.rb"
  ]

  query = {
    url = "https://jsonplaceholder.typicode.com/users"
  }
}

# Show us users and bs keys
output "users" {
  value = "${data.external.users.result}"
}
