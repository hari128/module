provider "aws" {
    access_key = "AKIATGPLVSTS3GE5WMCB"
    secret_key = "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"
    region = "us-east-1"
}

module devopsb16-testvpc {
  source = "./modules/vpc"
vpc_cidr = "10.120.0.0/16"
vpc_name = "DevOpsB16-TestVpc"
IGW_name = "DevOpsB16-Test-IGW"
key_name = "AWSB27"
azs = ["us-east-1a","us-east-1b","us-east-1c"]
public_subnets = ["10.120.1.0/24","10.120.2.0/24","10.120.3.0/24"]
private_subnets = ["10.120.10.0/24","10.120.20.0/24","10.120.30.0/24"]
Main_Routing_Table =   "Main_Routing_Table"
Private_Routing_Table = "Private_Routing_Table"
environment = "Prod"
}

module devopsb16-ec2 {
  source = "./modules/ec2"
imagename = "ami-013f17f36f8b1fefb"
instance_type = "t2.nano"
key_name = "AWSB27"
machinecount = "${module.devopsb16-testvpc.env == "Prod" ? 3 : 1 }"
sgid = "${module.devopsb16-testvpc.sgid}"
vpcname = "${module.devopsb16-testvpc.vpcname}"
public-subnets = "${module.devopsb16-testvpc.all_public_subnets}"
}