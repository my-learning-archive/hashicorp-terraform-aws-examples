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
export TF_VAR_string_example="example string"
terraform plan -var "number_example=5" -var-file "variables.tfvars"

# Apply terraform resources
terraform apply -var "number_example=5" -var-file "variables.tfvars"

# Destroy terraform resources
terraform destroy -var "number_example=5" -var-file "variables.tfvars"
