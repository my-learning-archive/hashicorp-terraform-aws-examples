resource "local_file" "example_file" {
  filename = "./example_file"
  content  = "this is an example file"
}

resource "local_sensitive_file" "example_sensitive_file" {
  filename = "./example_sensitive_file"
  content  = "this is an example sensitive file"
}
