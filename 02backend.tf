terraform {
  backend "s3" {
    bucket         = "tfstate-terra-78978"
    key            = "prod/statefiles"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "remote-backend"
  }
}