# Creating aws network for projct

resource "aws_vpc" "Proj-vpc" {
  cidr_block = var.vpc-cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "Proj-vpc"
  }
}

#Creating public subnet 1
resource "aws_subnet" "Proj-pubsub1" {
  vpc_id     = aws_vpc.Proj-vpc.id
  cidr_block = var.proj-pubsub1-cidr

  tags = {
    Name = "public-subnet"
  }
}

#Creating public subnet 2
resource "aws_subnet" "Proj-pubsub2" {
  vpc_id     = aws_vpc.Proj-vpc.id
  cidr_block = var.proj-pubsub2-cidr

  tags = {
    Name = "public-subnet"
  }
}

#Creating Private subnet 1
resource "aws_subnet" "Proj-privsub1" {
  vpc_id     = aws_vpc.Proj-vpc.id
  cidr_block = var.proj-privsub1-cidr

  tags = {
    Name = "private-subnet"
  }
}

#Creating Private subnet 2
resource "aws_subnet" "Proj-privsub2" {
  vpc_id     = aws_vpc.Proj-vpc.id
  cidr_block = var.proj-privsub2-cidr

  tags = {
    Name = "private-subnet"
  }
}

# Creating public route table
resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.Proj-vpc.id

  route = []

  tags = {
    Name = "Public-Route-table"
  }
}

# Creating private route table
resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.Proj-vpc.id

  route = []

  tags = {
    Name = "private-route-table"
  }
}

#Associating Public subnet 1 with public route table
resource "aws_route_table_association" "routetableass-publicsub-1" {
  subnet_id      = aws_subnet.Proj-pubsub1.id
  route_table_id = aws_route_table.Public-RT.id
}

#Associating Public subnet 2 with public route table
resource "aws_route_table_association" "routetableass-publicsub-2" {
  subnet_id      = aws_subnet.Proj-pubsub2.id
  route_table_id = aws_route_table.Public-RT.id
}

#Associating Private subnet 1 with private route table
resource "aws_route_table_association" "routetableass-privatesub-1" {
  subnet_id      = aws_subnet.Proj-privsub1.id
  route_table_id = aws_route_table.Private-RT.id
}

#Associating Private subnet 2 with private route table
resource "aws_route_table_association" "routetableass-privatesub-2" {
  subnet_id      = aws_subnet.Proj-privsub2.id
  route_table_id = aws_route_table.Private-RT.id
}

# Creating Internet gateway
resource "aws_internet_gateway" "proj-IGW" {
  vpc_id = aws_vpc.Proj-vpc.id

  tags = {
    Name = "IGW"
  }
}

#Associating Internet Gateway to public route table
resource "aws_route" "IGW-association" {
route_table_id = aws_route_table.Public-RT.id
gateway_id = aws_internet_gateway.proj-IGW.id
destination_cidr_block = "0.0.0.0/0"
}

