#aws_access_key = "xxxxxx"
#aws_secret_key = "yyyyyyy"
aws_region           = "us-east-2"
public_subnets_cidr  = ["10.33.1.0/24", "10.33.2.0/24", "10.33.3.0/24", "10.33.4.0/24"]
private_subnets_cidr = ["10.33.10.0/24", "10.33.20.0/24", "10.33.30.0/24", "10.33.40.0/24"]
vpc_cidr             = "10.33.0.0/16"
#public_subnet1_cidr = "10.1.1.0/24"
#public_subnet2_cidr = "10.1.2.0/24"
#public_subnet3_cidr = "10.1.3.0/24"
#private_subnet_cidr = "10.1.20.0/24"
vpc_name            = "terraform-aws-testing"
IGW_name            = "terraform-aws-igw"
public_subnet1_name = "Terraform_Public_Subnet1-testing"
public_subnet2_name = "Terraform_Public_Subnet2-testing"
public_subnet3_name = "Terraform_Public_Subnet3-testing"
private_subnet_name = "Terraform_Private_Subnet-testing"
Main_Routing_Table  = "Terraform_Main_table-testing"
key_name            = "LaptopKey"
environment         = "dev1"
owner               = "JAVA-APP"
project_id          = "PHOENIX123"
imagename =  {
us-east-1 = "ami-06ca3ca175f37dd66"
us-east-2 = "ami-06ca3ca175f37dd01"
#us-east-1 = "ami-06ca3ca175f37dd66"
#us-east-1 = "ami-06ca3ca175f37dd66"
}
