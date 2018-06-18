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

variable "subnet_id" {
  description = "ID for the subnet to deploy the Nexus server into"
}

variable "ssh_key_name" {
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

variable "allowed_ssh_cidr_blocks" {
  description = "List of CIDR blocks to allow SSH access to instance"
  type        = "list"
  default     = []
}

variable "allowed_inbound_cidr_blocks" {
  description = "List of CIDR blocks to allow access to Nexus"
  type        = "list"
  default     = []
}

variable "allowed_inbound_security_groups" {
  description = "List of security groups to allow access to Nexus"
  type        = "list"
  default     = []
}

variable "ssh_port" {
  description = "Port to use for SSH connection to instance"
  default     = 22
}
