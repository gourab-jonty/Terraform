subnet_prefix = [{ cidr_block = "10.0.1.0/24", name = "prod_subnet" }, { cidr_block = "10.0.2.0/24", name = "dev_subnet" }]
cidr_block = "10.0.0.0/16"
ami = "ami-085925f297f89fce1"
instance_type = "t2.micro"
availability_zone = "us-east-1a"
key_name = "main-key"
bucket = "terraform_bucket"
acl = "private"
versioning = "true"