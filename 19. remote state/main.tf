resource "local_file" "example_file" {
  filename = "./example-file.txt"
  content  = "This is an example file."
}

resource "local_sensitive_file" "example_sensitive_file" {
  filename = "./example-sensitive-file.txt"
  content  = "This is an example sensitive file."
}
