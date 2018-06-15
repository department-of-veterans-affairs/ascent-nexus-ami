# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "vpc_id" {
  description = "ID for the VPC to deploy the servers into"
}

variable "ami_id" {
  description = "ID for the AMI to launch the instance as"
}

variable "instance_subnet_id" {
  description = "ID for the subnet to deploy the Nexus server into"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "name" {
  description = "The name for the Name tag of the instance"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_type" {
  description = "The instance type of the instance (t2.micro, m4.large, etc)"
  default     = "m4.large"
}

variable "tags" {
  description = "Tags to apply to the EC2 instance. Name will be applied by default."
  type        = "map"
  default     = {}
}
