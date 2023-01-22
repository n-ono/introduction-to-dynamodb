resource "aws_dynamodb_table" "music" {
  name           = "Music"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Artist"
  range_key      = "SongTitle"

  attribute {
    name = "Artist"
    type = "S"
  }

  attribute {
    name = "SongTitle"
    type = "S"
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  attribute {
    name = "ReleaseDate"
    type = "S"
  }

  global_secondary_index {
    name               = "GenreIndex"
    hash_key           = "Genre"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["Artist", "SongTitle", "ReleaseDate"]
  }

  local_secondary_index {
    name               = "ReleaseDateIndex"
    range_key          = "ReleaseDate"
    projection_type    = "INCLUDE"
    non_key_attributes = ["Artist", "SongTitle", "Genre"]
  }
}
