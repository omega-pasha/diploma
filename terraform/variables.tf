variable "subnet_cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "instance_cores" {
  description = "Number of CPU cores"
  type        = map(number)
  default = {
    stage = 2
    prod  = 4
    other = 1
  }
}

variable "instance_memory" {
  description = "Number of memory (Gb)"
  type        = map(number)
  default = {
    stage = 4
    prod  = 8
    other = 2
  }
}

variable "instance_image_id" {
  description = "Image ID for instance"
  type        = string
  default     = "fd8oshj0osht8svg6rfs"
}

variable "folder_id" {
  default = "b1glodb3fcb408dgl593"
}

variable "svc_account_id" {
  default = "aje43v7g7g7b8jfa5no3"
}

variable "master_count" {
  type = map(number)
  default = {
    stage = 1
    prod  = 3
  }
}

variable "worker_count" {
  type = map(number)
  default = {
    stage = 2
    prod  = 3
  }
}
