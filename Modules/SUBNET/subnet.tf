resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_prefix[0].cidr_block
  availability_zone = "us-east-1a"

  tags = {
    Name = var.subnet_prefix[0].name
  }
}

# Create a subnet under that vpc
resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.subnet_prefix[1].cidr_block
  availability_zone = "us-east-1a"

}