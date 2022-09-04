# Variable for VPC cidr
variable "vpc-cidr" {
  type  = string
  description = "Vpc cidr block"
  default = "10.0.0.0/16"
}

# Variable for Public Subnet 1 variable
variable "proj-pubsub1-cidr" {
  type  = string
  description = "subnet cidr block"
  default = "10.0.10.0/24"
}

# Variable for Public Subnet 2 cidr
variable "proj-pubsub2-cidr" {
  type  = string
  description = "subnet cidr block"
  default = "10.0.20.0/24"
}

# Variable for Private Subnet 1 cidr 
variable "proj-privsub1-cidr" {
  type  = string
  description = "subnet cidr block"
  default = "10.0.30.0/24"
}

# Variable for Private Subnet 2 cidr 
variable "proj-privsub2-cidr" {
  type  = string
  description = "subnet cidr block"
  default = "10.0.40.0/24"
}

