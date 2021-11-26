provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0d718c3d715cec4a7"
  instance_type = "t2.small"
  subnet_id = "subnet-0af4ed161792cc2a3"
  key_name = "gds-import"

  tags = {
    Name = "Gagan-devops-server"
    env = "production"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}

