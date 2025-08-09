variable "region" {
  type        = string
  description = "Region of the ec2 instance"
  default = "us-east-1"
}

variable "volume-size" {
  type        = number
  default = 2
}

variable "ami_id" {
  type        = string
  description = "AMI Id of the ec2 instance"
  default     = "ami-020cba7c55df1f615" # Example AMI ID, replace with a valid one

}

variable "instance_type" {
  type        = string
  description = "t2.micro"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Key name of the ec2 instance"
  default     = "AmaerMOhamed" # Replace with your actual key pair name

}

variable "instance_count" {
  type        = number
  description = "Count of the ec2 instances"
  default     = 1
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet ids of the ec2 instance"
  default     = ["subnet-0bdfc2f8d663be6c9", "subnet-0cb5f222a3d03c6a8"] # Replace with actual subnet IDs
}

variable "tags" {
  type        = map(string)
  description = "Extra tags to attach to the ec2-sg resources"
  default = {
    For = "ok"
  }
}


variable "name" {
  type        = string
  description = "The name of the resources."
  default = "The Apalcaoin"
}

variable "environment" {
  type        = string
  description = "The environment name for the resources."
  default = "Dev"
}

variable "owner" {
  type        = string
  description = "Owner's name for the resource."
  default = "Ammar"
}

variable "cost_center" {
  type        = string
  description = "Cost center identifier for the resource."
  default = "CC-1001"
}

variable "application" {
  type        = string
  description = "Name of the application related to the resource."
  default = "inventory-system"
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the EC2 instance."
  type        = list(string)
  default = ["sg-02766b8bb4a7d424b"]

}