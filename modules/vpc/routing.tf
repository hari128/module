resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
    tags = {
        Name = "${var.Main_Routing_Table}"
    }
}

resource "aws_route_table" "terraform-private" {
    vpc_id = "${aws_vpc.default.id}"
    tags = {
        Name = "${var.Private_Routing_Table}"
    }
}

resource "aws_route_table_association" "public-subnets" {
    count = "${length(var.public_subnets)}"
    subnet_id = "${element(aws_subnet.public-subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.terraform-public.id}"
}

resource "aws_route_table_association" "private-subnets" {
    count = "${length(var.private_subnets)}"
    subnet_id = "${element(aws_subnet.private-subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.terraform-private.id}"
}