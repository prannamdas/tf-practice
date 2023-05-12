resource "aws_subnet" "aws_zonea_public_subnet_raj" {
    vpc_id = aws_vpc.aws_vpc_raj.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"

    tags = {
        Name = "aws_zonea_public_subnet_raj"
    }
}

resource "aws_subnet" "aws_zonea_private_subnet_raj" {
    vpc_id = aws_vpc.aws_vpc_raj.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2a"

    tags = {
        Name = "aws_zonea_private_subnet_raj"
    }
}

resource "aws_subnet" "aws_zoneb_public_subnet_raj" {
    vpc_id = aws_vpc.aws_vpc_raj.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-2b"

    tags = {
        Name = "aws_zoneb_public_subnet_raj"
    }
}

resource "aws_subnet" "aws_zoneb_private_subnet_raj" {
    vpc_id = aws_vpc.aws_vpc_raj.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-2b"

    tags = {
        Name = "aws_zoneb_private_subnet_raj"
    }
}