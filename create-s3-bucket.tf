resource "aws_s3_bucket" "bucket" {
    bucket = "my-server-bucket2000"

    tags = {
      Name        ="practice-bucket"
      Environment = "Dev"
    }
}