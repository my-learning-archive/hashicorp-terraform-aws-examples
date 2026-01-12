#!/bin/bash

# Use alias for opentofu
shopt -s expand_aliases
alias 'terraform'=tofu

# Set terraform log level and path
export TF_LOG=TRACE
export TF_LOG_PATH=/tmp/TRACE.log

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

# Taint terraform resource and observe results
terraform taint local_file.example_file
terraform plan

# Untaint terraform resource and observe results
terraform untaint local_file.example_file
terraform plan

# Destroy terraform resources
terraform destroy

# Check terraform logs
cat ${TF_LOG_PATH}
