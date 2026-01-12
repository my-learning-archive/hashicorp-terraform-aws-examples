resource "local_file" "overridden_file" {
  count    = length(var.filenames)
  filename = "./overridden_file"
  content  = "this file is overridden"
}

resource "local_file" "files" {
  for_each = toset(var.filenames)
  filename = each.value
  content  = "this file was not overridden - ${each.value}"
}
