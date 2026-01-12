#!/bin/bash

# Use alias for opentofu
shopt -s expand_aliases
alias 'terraform'=tofu

# Install required providers
terraform init

# Validate .tf files
terraform validate

# Format .tf files
terraform fmt

# Validate and show planned terraform resources
terraform plan

# Apply terraform resources
# Note: main.tf has a conditional expression.
#       if var.example_string_undefined is undefined, 
#        the content of the the local_file.example_file will be set to var.example_string
#       if var.example_string_undefined is defined at runtime,
#        the content of the the local_file_example_file will be set to var.example_string_undefined
terraform apply

# Issue commands to the terraform console
# Note: the interactive terraform console can be opened with 'terraform console'.
#       for more examples: https://developer.hashicorp.com/terraform/language/functions
echo 'max(5, 12, 9)' | terraform console
echo 'type(var.example_string)' | terraform console
echo 'type(var.example_string_undefined)' | terraform console

# Destroy terraform resources
terraform destroy
