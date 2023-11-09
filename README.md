# Terraform AWS EC2 and EBS Automation with Modules

This repository contains Terraform configuration code for automating the provisioning of AWS resources. It includes modules for creating EC2 instances and EBS volumes and demonstrates how to configure the state file to be stored in an S3 bucket.

## Table of Contents

- [Modules](#modules)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Storing Terraform State](#storing-terraform-state)
- [Contributing](#contributing)
- [License](#license)

## Modules

1. **ec2_instance_module**: This module allows you to create an EC2 instance with customizable configurations such as AMI, instance type, IAM instance profile, key name, security groups, subnet ID, and tags.

2. **ebs_volume_module**: This module is used to create EBS volumes with customizable sizes and attach them to the EC2 instance created by the `ec2_instance_module`.

## Getting Started

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/pavankumarindian/Terraform_AWS_EC2_and_EBS_Automation_with_Modules.git

Install Terraform on your machine. You can download it here. (https://developer.hashicorp.com/terraform/downloads)

Set up your AWS credentials and configure your default AWS region.

Update the main.tf file within the repository with your specific configuration values for the modules.

## Usage

Run terraform init to initialize your Terraform project.

Run terraform plan to see the execution plan.

Run terraform apply to create the AWS resources.

After successful execution, Terraform will output the EC2 instance ID.

## Storing Terraform State

To store the Terraform state in an S3 bucket:

Replace the backend block in your main.tf file with your own values, specifying your S3 bucket and desired settings.

Ensure your AWS credentials and permissions allow Terraform to access the S3 bucket.

## Contributing

Feel free to contribute to this project by submitting issues or pull requests. We welcome any improvements or additional features you'd like to add.

##  License
This repository is licensed under the MIT License.
