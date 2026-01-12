resource "local_file" "example_file_1" {
  filename = "./example_file"
  content  = lookup(var.example_map, terraform.workspace)
}

resource "local_file" "example_file_2" {
  filename = "./example_file_${lookup(var.example_map, terraform.workspace)}"
  content  = lookup(var.example_map, terraform.workspace)
}
