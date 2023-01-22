resource "aws_dynamodb_table" "music" {
  name           = "Music"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "MusicId"
  range_key      = "AttributeKey"

  attribute {
    name = "MusicId"
    type = "N"
  }

  attribute {
    name = "AttributeKey"
    type = "S"
  }

  attribute {
    name = "AttributeValue"
    type = "S"
  }

  global_secondary_index {
    name               = "MusicGSI"
    hash_key           = "AttributeKey"
    range_key          = "AttributeValue"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["MusicId"]
  }
}
