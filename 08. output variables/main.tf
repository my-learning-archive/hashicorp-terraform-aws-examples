resource "random_uuid" "id" {
}

output "id" {
  value = random_uuid.id.result
}
