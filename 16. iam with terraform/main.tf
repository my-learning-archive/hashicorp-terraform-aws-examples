# Create users
# (aws iam create-user ...)
resource "aws_iam_user" "example_users" {
  for_each = toset(var.example_users)
  name     = each.value
}

# Attach a user policy
# (aws iam attach-user-policy ...)
resource "aws_iam_user_policy_attachment" "example_user_policy_attachment" {
  user       = aws_iam_user.example_users["example-user-admin"].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create group
# (aws iam create-group ...)
resource "aws_iam_group" "example_group_developers" {
  name = "example-group-developers"
}

# Add users to group
# (aws iam add-user-to-group ...)
resource "aws_iam_group_membership" "example_group_developers_members" {
  name  = "example-group-developers-members"
  group = aws_iam_group.example_group_developers.name
  users = [
    aws_iam_user.example_users["example-user-admin"].name,
    aws_iam_user.example_users["example-user-developer"].name
  ]
}

# Attach a group policy
# (aws iam attach-group-policy ...)
resource "aws_iam_group_policy_attachment" "example_group_policy_attachment" {
  group      = aws_iam_group.example_group_developers.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
