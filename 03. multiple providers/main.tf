# Official provider - random
# https://registry.terraform.io/providers/hashicorp/random/latest
resource "random_pet" "example_pet" {
  length    = "1"
  separator = "."
}
