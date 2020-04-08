data "aws_caller_identity" "current" {}

resource "aws_dynamodb_table" "dynamo-db" {
  name            = "${var.environment}-dynamo-db"
  billing_mode    = var.billing_mode
  read_capacity   = var.read_capacity
  write_capacity  = var.write_capacity
  hash_key        = var.table_hash_key
  range_key       = var.table_range_key

  attribute {
    name = var.table_hash_key
    type = "S"
  }

  attribute {
    name = var.table_range_key
    type = "N"
  }

//  ttl {
//    attribute_name = "TimeToExist"
//    enabled = false
//  }

  global_secondary_index {
    name            = "${var.environment}-dynamo-db-index"
    hash_key        = var.gsi_hash_key
    write_capacity  = var.write_capacity
    read_capacity   = var.read_capacity
    projection_type = var.projection_type
  }

  tags = merge(var.default_tags, map("Name", "${var.environment}-dynamo-db"))
}