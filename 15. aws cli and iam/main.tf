data "aws_iam_user" "example_user_admin" {
  user_name = "example-user-admin"
}

data "aws_iam_user" "example_user_developer" {
  user_name = "example-user-developer"
}

data "aws_iam_group" "example_group_developers" {
  group_name = "example-group-developers"
}
