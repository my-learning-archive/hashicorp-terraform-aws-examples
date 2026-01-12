resource "local_file" "example_file" {
  filename = "./example_file"
  content  = lookup(var.example_map, terraform.workspace)
}
