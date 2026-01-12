# Create local file (which will be uploaded to the S3 bucket)
resource "local_file" "example_file" {
  filename = "./example-file.txt"
  content  = "This is an example file."
}

# Create S3 bucket
# (aws s3api create-bucket --bucket "example-s3-bucket" --region "eu-central-1" --create-bucket-configuration "LocationConstraint=eu-central-1")
resource "aws_s3_bucket" "example_s3_bucket" {
  bucket = "example-s3-bucket"
}

# Upload file to S3 bucket
# (aws s3 cp "./example-file.txt" "s3://example-s3-bucket")
resource "aws_s3_object" "example_upload" {
  bucket = aws_s3_bucket.example_s3_bucket.bucket
  source = local_file.example_file.filename
  key    = "example-file.txt"
}
