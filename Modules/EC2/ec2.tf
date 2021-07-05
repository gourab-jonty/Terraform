resource "aws_instance" "web-server-instance" {
   ami               = var.ami
   instance_type     = var.instance_type
   availability_zone = var.availability_zone
   key_name          = var.key_name
   subnet_id         = aws_subnet.subnet-2.id
   vpc_security_group_ids = [aws_security_group.allow_web.id]

   

   user_data = <<-EOF
                 #!/bin/bash
                 sudo apt update -y
                 sudo apt install apache2 -y
                 sudo systemctl start apache2
                 sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                 EOF
 }