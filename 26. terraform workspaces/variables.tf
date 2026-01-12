variable "example_map" {
  type = map(any)
  default = {
    "workspaceA" = "this terraform resource is created in the 'workspaceA' terraform workspace."
    "workspaceB" = "this terraform resource is created in the 'workspaceB' terraform workspace."
  }
}
