provider "aws" {
    access_key = "AKIATGPLVSTSU7RPEMH2"
    secret_key = "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"
    region = "us-east-1"
}



module devopsb16dev {
  source = "./modules/vpc"
vpc_cidr = "10.160.0.0/16"
vpc_name = "devopesB16dev"
IGW_name = "devopesB16_igw"
key_name = "AWSB27"

public_subnet1_cidr = "10.160.1.0/24"
public_subnet2_cidr = "10.160.2.0/24"
public_subnet3_cidr = "10.160.3.0/24"
public_subnet1_name = "public_subnet1"
public_subnet2_name = "public_subnet2"
public_subnet3_name = "public_subnet3"
Main_Routing_Table  = "Main_Routing_Table"
environment = "dev"

}



module devopsb16devec2 {
  source = "./modules/ec2"
 imagename = "ami-042e8287309f5df03"
 subnetid = "${module.devopsb16dev.subnet1id}"
 sgid  = "${module.devopsb16dev.sgid}"
 servername = "test-evn-server-1"

}





