# Create SSH key pair
# (aws ec2 import-key-pair --key-name "example-key-pair" --public-key-material "fileb://./.ssh/keypair.pub" --region "eu-central-1")
resource "aws_key_pair" "example_key_pair" {
  key_name   = "example-key-pair"
  public_key = file("./.ssh/keypair.pub")
}

# Create EC2 instance
# (aws ec2 run-instances --image-id "ami-063953778d3b43a63" --instance-type "m5.large" --key-name "example-key-pair" --region "eu-central-1")
resource "aws_instance" "example_ec2_instance" {
  ami           = "ami-063953778d3b43a63"
  instance_type = "m5.large"
  key_name      = aws_key_pair.example_key_pair.key_name
  provisioner "local-exec" {
    command = "echo ${self.ami}"
  }
}

# Note: instance AMIs can be consulted here: https://cloud-images.ubuntu.com/locator/ec2/
#       we are using an instance in 'eu-central-1', as that is the region chosen in the provider configuration.

# Note: because the aws_instance created in LocalStacks is a stub, 
#       the 'file' and 'remote-exec' provisioners will not work (as they require a real .ssh connection).
#       therefore, the demonstration is limited to the 'local-exec' provisioner.
