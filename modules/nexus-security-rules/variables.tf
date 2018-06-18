# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_id" {
  description = "The VPC ID for the security group"
}

variable "security_group_id" {
  description = "The security group ID of the security group to apply these rules to"
}

variable "allowed_inbound_cidr_blocks" {
  description = "List of cidr blocks that are allowed access"
  type        = "list"
  default     = []
}

variable "allowed_inbound_security_groups" {
  description = "List of security groups that are allowed access"
  type        = "list"
  default     = []
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "http_port" {
  description = "The http port that the nexus is running on."
  default     = "8081"
}

variable "docker_lower_bound_port" {
  description = "The lower bound port of the range for docker connectors"
  default     = "5000"
}

variable "docker_upper_bound_port" {
  description = "The upper bound port of the range for docker connectors"
  default     = "5002"
}
