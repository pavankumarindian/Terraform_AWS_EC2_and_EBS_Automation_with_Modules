# ebs_volume/variables.tf

variable "size" {
  description = "Size of the EBS volume"
  default     = 8
}

variable "availability_zone" {
    default     = "ap-south-1a" 
}