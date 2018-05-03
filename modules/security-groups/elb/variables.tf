# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_id" {
  description = "The VPC ID for the security group"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "name" {
  description = "Name of the security group"
  default     = "nexus_elb"
}

variable "description" {
  description = "Description of the security group"
  default     = "Load Balancer for Vets.gov Nexus Server"
}

variable "https_port" {
  description = "The port for accessing HTTPS"
  default     = "443"
}

variable "docker_lower_bound_port" {
  description = "The lower bound port of the range for docker connectors"
  default     = "5000"
}

variable "docker_upper_bound_port" {
  description = "The upper bound port of the range for docker connectors"
  default     = "5002"
}

variable "outbound_access_port" {
  description = "The outbound internet access port"
  default     = "0"
}

variable "allowed_cidr_blocks" {
  description = "List of cidr blocks that are allowed access"
  type        = "list"
  default     = ["0.0.0.0/0"]
}
