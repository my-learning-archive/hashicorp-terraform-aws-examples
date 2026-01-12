resource "local_file" "example_file" {
  filename = "./example_file"
  content  = var.example_string_undefined == "" ? var.example_string : var.example_string_undefined
}
