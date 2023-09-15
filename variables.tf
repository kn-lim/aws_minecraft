variable "region" {
  description = "The AWS region where the resources will be created"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the existing key pair to be used for the Minecraft instance"
  type        = string
}

variable "name" {
  description = "The base name to use for the Minecraft instance and security group"
  type        = string
  default     = "minecraft"
}

variable "instance_type" {
  description = "The EC2 instance type for the Minecraft server"
  type        = string
  default     = "t2.small"
}

variable "server_url" {
  description = "The URL from which the Minecraft server.jar file will be downloaded"
  type        = string
}

variable "java_max_memory" {
  description = "The maximum amount of memory (in MB) to allocate to the Minecraft server"
  type        = string
  default     = "1024"
}

variable "personal_ip" {
  description = "The personal IP address to allow SSH access to the Minecraft instance"
  type        = string
}

variable "personal_subnet" {
  description = "The subnet mask for the personal IP, typically set to '32' for a single IP address"
  type        = string
  default     = "32"
}
