variable "string_example" {
  type    = string
  default = "example string"
}

variable "number_example" {
  type    = number
  default = 5
}

variable "bool_example" {
  type    = bool
  default = true
}

variable "map_example" {
  type = map(any)
  default = {
    first  = "map's first element"
    second = "map's second element"
  }
}

variable "list_example" {
  type    = list(string)
  default = ["list's first element", "list's second element"]
}

variable "set_example" {
  type    = set(string)
  default = ["set's first element", "set's second element"]
}

