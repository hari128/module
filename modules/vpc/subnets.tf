resource "aws_subnet" "public-subnets" {
    count = "${length(var.public_subnets)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs,count.index)}"
    cidr_block = "${element(var.public_subnets,count.index)}"
    tags = {
        Name = "Public_Subnet_${count.index+1}"
    }
}


resource "aws_subnet" "private-subnets" {
    count = "${length(var.public_subnets)}"
    vpc_id = "${aws_vpc.default.id}"
    availability_zone = "${element(var.azs,count.index)}"
    cidr_block = "${element(var.private_subnets,count.index)}"
    tags = {
        Name = "${var.vpc_name}-Private_Subnet_${count.index+1}"
    }
}