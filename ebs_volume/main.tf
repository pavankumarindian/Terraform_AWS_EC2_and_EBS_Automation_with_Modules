# ebs_volume/main.tf

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.availability_zone
  size = var.size
}

