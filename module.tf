
# Create VPC
module "vpc_module" {
  source = "./Modules/VPC/"
  cidr_block = "${var.cidr_block}"
  
}

# Create a subnet under that vpc 
module "subnet_module" {
  source = "./Modules/SUBNET/"
  subnet_prefix = "${var.subnet_prefix}"
  
}

 # Create Security Group
 module "sg_module" {
   source = "./Modules/SG/"
 }
 
# Create Ubuntu server and install/enable apache2
module "ec2_module" {
  source = "./Modules/EC2"
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.availability_zone}"
  key_name = "${var.key_name}"
}

# Create S3
 module "s3_module" {
   source = "./Modules/S3"
   bucket = "${var.bucket}"
   acl = "${var.acl}"
   versioning = "${var.versioning}"
   
 }




















# # 2. Create Internet Gateway

# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.prod-vpc.id


# }
# # 3. Create Custom Route Table

# resource "aws_route_table" "prod-route-table" {
#   vpc_id = aws_vpc.prod-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   route {
#     ipv6_cidr_block = "::/0"
#     gateway_id      = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "Prod"
#   }
# }


# # 5. Associate subnet with Route Table
# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.subnet-1.id
#   route_table_id = aws_route_table.prod-route-table.id
# }


# # 7. Create a network interface with an ip in the subnet that was created in step 4

# resource "aws_network_interface" "web-server-nic" {
#   subnet_id       = aws_subnet.subnet-1.id
#   private_ips     = ["10.0.1.50"]
#   security_groups = [aws_security_group.allow_web.id]

# }
# # 8. Assign an elastic IP to the network interface created in step 7

# resource "aws_eip" "one" {
#   vpc                       = true
#   network_interface         = aws_network_interface.web-server-nic.id
#   associate_with_private_ip = "10.0.1.50"
#   depends_on                = [aws_internet_gateway.gw]
# }

# output "server_public_ip" {
#   value = aws_eip.one.public_ip
# }


