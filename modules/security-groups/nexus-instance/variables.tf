# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------
variable "vpc_id" {
  description = "The VPC ID for the security group"
}

variable "elb_security_group_ids" {
  description = "The security group IDs of the elb"
  type        = "list"
}



# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "name" {
  description = "Name of the security group"
  default     = "vets_nexus"
}

variable "description" {
  description = "Description of the security group"
  default     = "Nexus Server SG"
}

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

variable "monitoring_client_port" {
  description = "The port for the monitoring client"
  default     = "9100"
}

variable "ssh_port" {
  description = "The SSH port"
  default     = "22"
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
