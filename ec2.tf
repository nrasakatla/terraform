 resource "aws_instance" "web-1" {
 #    count = 2
     count = var.environment == "dev" || var.environment == "DEV" ? 2 : 1
     ami = lookup(var.imagename, var.aws_region)
     #ami = "ami-0d857ff0f5fc4e03b"
     #ami = "${data.aws_ami.my_ami.id}"
     availability_zone = "us-east-1a"
     instance_type = "t2.micro"
     key_name = "test"
     subnet_id = element(aws_subnet.public-subnet.*.id, count.index)
     vpc_security_group_ids = ["${aws_security_group.sg_dynamic.id}"]
     associate_public_ip_address = true
     tags = {
         environment = var.environment
         Name = "Server-1-${count.index +1}"
         Env = "Prod"
         Owner = "Sree"
       CostCenter = "ABCD-EFG"
     }
      user_data     = <<-EOF
                    #!/bin/bash
                    echo "Hello, World!" > hello.txt
                  EOF
 }
