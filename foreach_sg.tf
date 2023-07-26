locals {
  ingress    = toset([80, 443, 22, 333, 222, 111, 222, 333, 111, 222, 333])
  egress     = toset([443,80, 888, 777, 666, 777, 888, 666, 777, 888])
  tag_keys   = distinct(["Name", "Location", "Owner", "Name", "Owner", "costcentre"])
  tag_values = distinct(["Dynamic_sg", "USA", "DevopsB31", "ABCD12345", "Dynamic_sg"])
  my_tags = {
    "Name"       = "the_dynamic_sg",
    "Location"   = "USA",
    "Owner"      = "DevopsB31",
    "CostCenter" = "ABCD12345"
  }

}

resource "aws_security_group" "sg_dynamic" {
  name        = "the_dynamic_sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id
  dynamic "ingress" {
    for_each = local.ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
#      cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
      cidr_blocks = ["0.0.0.0/32"]
    }
  }
  dynamic "egress" {
    for_each = local.egress
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
