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
terraform apply

# Terraform state command examples
terraform state help
terraform state list
terraform state show local_file.example_file
terraform state show local_sensitive_file.example_sensitive_file

# Destroy terraform resources
terraform destroy
