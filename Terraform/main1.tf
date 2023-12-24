# resource "aws_vpc" "custom_vpc" {
#   cidr_block = "10.0.0.0/16" 
#   tags = {
#     Name = "Prod-VPC"
#   }
# }

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.custom_vpc.id
# }

# resource "aws_route_table" "route_table" {
#   vpc_id = aws_vpc.custom_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }
#   tags = {
#     Name = "prod-RT"
#   }
# }
# resource "aws_subnet" "custom_subnet" {
#   vpc_id            = aws_vpc.custom_vpc.id
#   cidr_block        = "10.0.1.0/24"  
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "prod-subnet"
#   }
# }

# resource "aws_route_table_association" "route_table_asso" {
#   subnet_id      = aws_subnet.custom_subnet.id
#   route_table_id = aws_route_table.route_table.id
# }

# resource "aws_security_group" "instance_sg" {
#   name        = "webserver_sg"
#   description = "Allow inbound SSH and HTTP traffic"
#   # vpc_id      = aws_vpc.custom_vpc.id
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 3000
#     to_port     = 3000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "Web-traffic"
#   }
# }

# resource "aws_key_pair" "ssh_key" {
#   key_name   = "ssh_generated_key"
#   public_key = file("sshkeys.pub")
  
# }

# resource "aws_instance" "webserver" {
#   ami               = "ami-0c7217cdde317cfec"
#   instance_type     = "t2.xlarge"               
#   key_name          = aws_key_pair.ssh_key.key_name               
#   availability_zone = "us-east-1a"
#   # vpc_security_group_ids = [aws_security_group.instance_sg.id]
#   tags = {
#     Name = "Web-Server"
#   }
#   user_data = file("script.sh")
# }
# output "public_ip" {
#   value = aws_instance.webserver.public_ip
# }


# https://www.sammeechward.com/terraform-vpc-subnets-ec2-and-more
# actual code use the above link for the terraform code.
