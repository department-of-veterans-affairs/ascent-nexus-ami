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

variable "elb_subnet_ids" {
    description = "ID for the subnet to deploy the ELB into"
    type = "list"
}

variable "key_name" {
    description = "Desired name of AWS key pair"
}

variable "elb_cert_arn" {
    description = "ARN for the certificate to associate with the ELB"
}

variable "env" {
    description = "Environment tag value"
}


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_type" {
    description = "The instance type of the instance (t2.micro, m4.large, etc)"
    default     = "m4.large"
}

variable "instance_name" {
    description = "The name for the Name tag of the instance"
    default     = "vets-nexus"
}

variable "project_name" {
    description = "The name for the ProjectName tag of the instance"
    default     = "VAEC AWS Gov General Support Service"
}

variable "vaecid" {
    description = "The name for the VAECID tag of the instance"
    default     = "AWG20170915001"
}
