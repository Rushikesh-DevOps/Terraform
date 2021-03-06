/* Create new ec2 instance with below configurations*/

resource "aws_instance" "rushiphp1" {
  //count         = 2
  ami           = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
  tags = {
    Name             = "rushiphp1"
    Created_By       = "Terraform_Automation"
    Application_Name = "Terraform_Demo"

  }

  key_name  = "ansible-demo"
  subnet_id = "subnet-79cd2912"


  user_data = <<-EOF
               #!/bin/bash 
					     yum update -y 
					     yum install wget 
					     wget https://www.apachefriends.org/xampp-files/7.0.23/xampp-linux-x64-7.0.23-0-installer.run 
					     chmod +x xampp-linux-x64-7.0.23-0-installer.run 
					     ./xampp-linux-x64-7.0.23-0-installer.run 
					     sudo /opt/lampp/lampp start
					     sudo /opt/lampp/lampp restart
                EOF
}
resource "aws_security_group" "all_rushikesh" {
  name        = "all_rushikesh"
  description = "allow_all_trafic inbound traffic,Allow all outbound traffic"

  ingress {
    #http
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow_all trafic inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all traffic outbound"
  }
}
