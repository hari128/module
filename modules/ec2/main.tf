resource "aws_instance" "web-1" {
    ami = var.imagename
    instance_type = "t2.micro"
    key_name = "AWSB27"
    subnet_id = "${var.subnetid}"
    vpc_security_group_ids = ["${var.sgid}"]
    associate_public_ip_address = true	
    tags = {
        Name = "var.servername"
      
    }
}