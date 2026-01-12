resource "local_file" "variable_expansions" {
  filename = "./variable_expansions"
  content = <<EOF

-- string expansion --
${var.string_example}

-- number expansion --
${var.number_example}

-- bool expansion --
${var.bool_example}

-- map expansion --
${var.map_example["first"]}
${var.map_example["second"]}

-- list expansion --
${var.list_example[0]}
${var.list_example[1]}

-- set expansion --
${
  join("\n", [
    for element in var.set_example :
    "${element}"
  ])
}

EOF
}
