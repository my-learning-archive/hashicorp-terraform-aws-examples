resource "random_string" "example_string" {
  length = 10
  keepers = {
    trigger = var.user_input
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "local_file" "example_file" {
  filename = "./example_file"
  content  = var.user_input
  lifecycle {
    create_before_destroy = true
  }
}

# if set lifecycle.prevent_destroy='true', 'terraform destroy' will not work without the '-target' flag
resource "local_file" "example_file_2" {
  filename = "./example_file_2"
  content  = var.user_input
  lifecycle {
    prevent_destroy = false
  }
}
