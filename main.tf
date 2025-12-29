provider "aws" {
  region = "us-east-1"
}

# This is a 'pricey' instance to test our FinOps pipeline
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "m5.12xlarge" # This costs roughly $500+/month

  root_block_device {
    volume_size = 100 
  }
}