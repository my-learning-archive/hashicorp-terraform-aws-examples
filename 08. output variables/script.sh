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

# Get attributes of terraform resources in state
terraform show

# Get all terraform outputs
terraform output

# Get the terraform output named 'id'
terraform output id

# Destroy terraform resources
terraform destroy
