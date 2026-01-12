resource "time_static" "time_update" {
}

resource "local_file" "implicit_dependency" {
  filename = "./implicit_dependency"
  content  = "depends on time_update because it uses a reference expression: ${time_static.time_update.id}"
}

resource "local_file" "explicit_dependency" {
  filename   = "./explicit_dependency"
  content    = "depends on time_update because it uses the depends_on expression."
  depends_on = [time_static.time_update]
}
