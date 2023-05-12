resource "aws_internet_gateway" "aws_internet_gateway_raj" {
    vpc_id = aws_vpc.aws_vpc_raj.id
}

resource "aws_route_table" "aws_publice_route_table_raj" {
    vpc_id = aws_vpc.aws_vpc_raj.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.aws_internet_gateway_raj.id
    }

    tags = {
        Name = "Public-routs"
    }
}

resource "aws_nat_gateway" "private_nat_gateway" {
    connectivity_type = "private"
    subnet_id = aws_subnet.aws_zonea_public_subnet_raj.id
}

resource "aws_route_table" "aws_private_route_table" {
    vpc_id = aws_vpc.aws_vpc_raj.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.private_nat_gateway.id
    }

    tags = {
        Name = "Private-routes"
    }
  
}

resource "aws_route_table_association" "public_zonea" {
    subnet_id = aws_subnet.aws_zonea_public_subnet_raj.id
    route_table_id = aws_route_table.aws_publice_route_table_raj.id
}

resource "aws_route_table_association" "public_zoneb" {
    subnet_id = aws_subnet.aws_zoneb_public_subnet_raj.id
    route_table_id = aws_route_table.aws_publice_route_table_raj.id
}

resource "aws_route_table_association" "private_zonea" {
    subnet_id = aws_subnet.aws_zonea_private_subnet_raj.id
    route_table_id = aws_route_table.aws_private_route_table.id
}

resource "aws_route_table_association" "private_zoneb" {
    subnet_id = aws_subnet.aws_zoneb_private_subnet_raj.id
    route_table_id = aws_route_table.aws_private_route_table.id
}
