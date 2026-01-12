data "local_file" "os" {
  filename = "/etc/os-release"
}

output "os_version" {
  value = data.local_file.os.content
}
