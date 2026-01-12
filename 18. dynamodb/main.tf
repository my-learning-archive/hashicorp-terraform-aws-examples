# Create DynamoDB table
# (aws dynamodb create-table ...)
resource "aws_dynamodb_table" "example_dynamodb_table" {
  name         = "example-dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ItemId"

  attribute {
    name = "ItemId"
    type = "N"
  }
  attribute {
    name = "ItemName"
    type = "S"
  }
  attribute {
    name = "ItemValid"
    type = "B"
  }
  global_secondary_index {
    name            = "ItemName"
    hash_key        = "ItemName"
    projection_type = "ALL"
  }
  global_secondary_index {
    name            = "ItemValid"
    hash_key        = "ItemValid"
    projection_type = "ALL"
  }
}

# Create DynamoDB table items
# (aws dynamodb put-item ...)
resource "aws_dynamodb_table_item" "example_dynamodb_table_item_1" {
  table_name = aws_dynamodb_table.example_dynamodb_table.name
  hash_key   = aws_dynamodb_table.example_dynamodb_table.hash_key
  item       = <<EOF
{
  "ItemId": {"N": "1"},
  "ItemName": {"S": "example-dynamodb-table-item-1"},
  "ItemValid": {"B": "true" }
}
EOF
}

resource "aws_dynamodb_table_item" "example_dynamodb_table_item_2" {
  table_name = aws_dynamodb_table.example_dynamodb_table.name
  hash_key   = aws_dynamodb_table.example_dynamodb_table.hash_key
  item       = <<EOF
{
  "ItemId": {"N": "2"},
  "ItemName": {"S": "example-dynamodb-table-item-2"},
  "ItemValid": {"B": "true" }
}
EOF
}


