output "server_private_ip" {
   value = aws_instance.web-server-instance.private_ip

 }

 output "server_id" {
   value = aws_instance.web-server-instance.id
 }

 output "s3_arn"{
   value = aws_s3_bucket.bucket.arn
 }

 output "sg_name"{
   value = aws_security_group.allow_web.name
 }

 output "vpc_id"{
   value = aws_vpc.prod-vpc.id
 }