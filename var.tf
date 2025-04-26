
variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "profile" {
  description = "AWS profile"
  type        = string
  default     = "ten10"
}

variable "vpc_name" {
  description = "VPC name tag"
  type        = string
  default     = "ewan-vpc"
}

variable "internet_gateway_name" {
  description = "Internet Gateway name tag"
  type        = string
  default     = "ewan-gateway"
}

variable "public_subnet_name" {
  description = "Public Subnet name tag"
  type        = string
  default     = "ewan-public-subnet"
}
variable "private_subnet_name" {
  description = "Private Subnet name tag"
  type        = string
  default     = "ewan-private-subnet"
}
variable "public_rt_name" {
  description = "Public Route Table name tag"
  type        = string
  default     = "ewan-public-rt"
  
}
variable "public_security_group_name" {
  description = "Public Security Group name tag"
  type        = string
  default     = "ewan-public-sg"
  
}

variable "private_security_group_name" {
  description = "Private Security Group name tag"
  type        = string
  default     = "ewan-private-sg"
  
}


