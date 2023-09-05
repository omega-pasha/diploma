variable "subnet_cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "instance_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 4
}

variable "instance_memory" {
  description = "Number of memory (Gb)"
  type        = number
  default     = 4
}

variable "instance_image_id" {
  description = "Image ID for instance"
  type        = string
  default     = "fd8oshj0osht8svg6rfs"
}
