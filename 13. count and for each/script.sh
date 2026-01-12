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

# Get attributes of specific terraform resources - local_file.overridden_file
# Note: the file was created using 'count', and was created only once.
#       this happened because we kept the same filename for each iteration, overwriting the previous.
#       this highlights the problem of using 'count' without care.
#       even so, in the state, the resource is represented as a 4-element list
terraform state show 'local_file.overridden_file[0]'
terraform state show 'local_file.overridden_file[1]'
terraform state show 'local_file.overridden_file[2]'
terraform state show 'local_file.overridden_file[3]'

# Get attributes of specific terraform resources - local_file.files
# Note: the files were created using 'for_each', and were created correctly.
#       in the state, the resource is represented as a 3-element map.
terraform state show 'local_file.files["./file1"]'
terraform state show 'local_file.files["./file2"]'
terraform state show 'local_file.files["./file3"]'

# Destroy terraform resources
terraform destroy
