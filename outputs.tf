# 1. VPC ID
# 2. Public Subnets - subnet_key => { subnet_id, availability_zone }  ID of the subnets
# 3. Private Subnets - subnet_key => { subnet_id availability_zone } ID of the subnets 

locals {
  output_public_subnet = {
    for key in keys(local.public_subnets) : key => {
      subnet_id        = aws_subnet.this[key].id
      avaiability_zone = aws_subnet.this[key].availability_zone
    }
  }

  output_private_subnet = {
    for key in keys(local.private_subnets) : key => {
      subnet_id        = aws_subnet.this[key].id
      avaiability_zone = aws_subnet.this[key].availability_zone
    }
  }
}


output "vpc_id" {
  description = "The AWS ID from the created VPC"
  value       = aws_vpc.this.id
}


output "public_subnets" {
  description = "The ID and the availability zone of public sunets"
  value       = local.output_public_subnet
}


output "private_subnets" {
  description = "The ID and the availability zone of private sunets"
  value       = local.output_private_subnet
}
