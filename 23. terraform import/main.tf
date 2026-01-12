# Create EC2 instance
# (aws ec2 run-instances --image-id "ami-063953778d3b43a63" --instance-type "m5.large" --region "eu-central-1")
resource "aws_instance" "example_ec2_instance" {
  ami           = "ami-063953778d3b43a63"
  instance_type = "m5.large"
  provisioner "local-exec" {
    command = "echo ${self.ami}"
  }
}
