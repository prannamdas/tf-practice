resource "aws_vpc" "aws_vpc_raj" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "aws_vpc_raj"
    }
}