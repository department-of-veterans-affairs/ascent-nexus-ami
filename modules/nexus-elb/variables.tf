# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "elb_subnet_ids" {
    description = "ID for the subnet to deploy the ELB into"
    type = "list"
}

variable "nexus_instance_ids" {
    description = "IDS of the nexus instances to load balance"
    type = "list"
}

variable "elb_cert_arn" {
    description = "ARN for the certificate to associate with the ELB"
}

variable "vpc_id" {
  description = "The VPC ID"
}


# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "http_instance_port" {
  description = "The instance port for http access"
  default     = "8081"
}

variable "https_lb_port" {
  description = "The port of the load balancer to connect to"
  default = "443"
}

variable "docker_port_1" {
  description = "Port for a docker swarm connection."
  default     = "5000"
}

variable "docker_port_2" {
  description = "Port for docker swarm connections"
  default     = "5001"
}

variable "docker_port_3" {
  description = "Port for docker swarm connections"
  default     = "5002"
}

variable "healthy_threshold" {
  description = "The number of checks before the instance is declared healthy."
  default     = 2
}

variable "unhealthy_threshold" {
  description = "The number of checks before the instance is declared unhealthy."
  default     = 2
}

variable "timeout" {
  description = "The length of time before the check times out."
  default     = 3
}

variable "interval" {
  description = "The interval between checks."
  default     = 30
}

variable "nexus_domain_name" {
  description = "The domain name for nexus"
  default     = "nexus.internal.vet-services.gov"
}
