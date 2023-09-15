variable "region" {
  description = "Region of the Minecraft instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the Key Pair for the Minecraft instance"
  type        = string
}

variable "name" {
  description = "Name of the Minecraft instance"
  type        = string
  default     = "minecraft"
}

variable "instance_type" {
  description = "Instance type of the Minecraft instance"
  type        = string
  default     = "t2.small"
}

variable "server_url" {
  description = "URL to download the Minecraft server.jar"
  type        = string
}

variable "java_max_memory" {
  description = "Max amount of memory to allocate (MB)"
  type        = string
  default     = "1024"
}

variable "personal_ip" {
  description = "Your Personal IP"
  type        = string
}

variable "personal_subnet" {
  description = "Your Personal Subnet"
  type        = string
  default     = "32"
}
