#!/bin/bash

# Use Opentofu 'disguised' as Terraform
shopt -s expand_aliases
alias 'terraform'=tofu

# Show required providers
terraform providers

# Install required providers
terraform init

# Validate .tf files
terraform validate

# Format .tf files
terraform fmt
