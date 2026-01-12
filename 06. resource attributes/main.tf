resource "time_static" "time_update" {
}

resource "local_file" "time" {
  filename = "./time"
  content  = "timestamp: ${time_static.time_update.id}"
}
