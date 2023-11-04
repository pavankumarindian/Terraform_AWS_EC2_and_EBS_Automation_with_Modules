# main.tf

module "ec2_instance" {
  source = "./ec2_instance"

  # Pass the required variables here
  ami                    = "ami-05c0f5389589545b7"
  instance_type          = "t2.micro"
  availability_zone      = "ap-south-1a"
  iam_instance_profile   = "pavan"
  key_name               = "demo-key"
  security_groups        = ["sg-0963aab46e0fbbc94"]
  subnet_id              = "subnet-0e41453c9b1028803" # Reference the subnet_id from the VPC and Subnets Module
  tags = {
    Name       = "ExampleInstance"
    Environment = "Development"
  }
}

module "ebs_volume_8gb" {
  source = "./ebs_volume"
  size   = 8
  # You can pass any required variables for the EBS Volume module if needed
}

module "ebs_volume_12gb" {
  source = "./ebs_volume"
  size   = 12
  # You can pass any required variables for the EBS Volume module if needed
}

# Attach EBS volumes to the EC2 instance
resource "aws_volume_attachment" "ebs_attachment_8gb" {
  device_name = "/dev/sdf"  # Device name to attach the volume to (example)
  volume_id   = module.ebs_volume_8gb.ebs_volume_id
  instance_id = module.ec2_instance.ec2_instance_id
}

resource "aws_volume_attachment" "ebs_attachment_12gb" {
  device_name = "/dev/sdg"  # Device name to attach the volume to (example)
  volume_id   = module.ebs_volume_12gb.ebs_volume_id
  instance_id = module.ec2_instance.ec2_instance_id
}

# Define your S3 backend to save the state file in an S3 bucket
terraform {
  backend "s3" {
    bucket = "pavanssonixbucket1"
    key    = "terraform.tfstate"
    region = "ap-south-1"  # Specify the AWS region for your S3 bucket
  }
}

