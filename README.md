# terraform-aws-minecraft

Terraform module to create a Minecraft Server on AWS.

The module adds a startup script to automatically launch the Minecraft server whenever the EC2 instance is turned on.

Terraform Registry: https://registry.terraform.io/modules/kn-lim/minecraft/aws/latest

## Requirements

| Name | Version |
| - | - |
| terraform | >= 1.5 |
| [aws](https://registry.terraform.io/providers/hashicorp/aws) | >= 5.0 |

You will also need to provide the [Minecraft Server JAR Download URL](https://www.minecraft.net/en-us/download/server).

# How to Use

## Variables

| Name | Description | Default |
| - | - | - |
| `region` | AWS Region of the Minecraft instance |
| `key_pair_name` | Name of the AWS Key Pair for the Minecraft instance |
| `name` | Name of the Minecraft instance | `minecraft` |
| `instance_type` | Instance type of the Minecraft instance | `t2.small` |
| `server_url` | URL to download the Minecraft server.jar |
| `java_max_memory` | Max amount of memory to allocate (MB) | `1024` |
| `personal_ip` | Your Personal IP Address |
| `personal_subnet` | Your Personal Subnet | `32` |

## Example Terraform File

```js
module "minecraft" {
  source = "kn-lim/terraform-aws-minecraft"

  region          = "us-west-2"
  key_pair_name   = "minecraft"
  name            = "minecraft"
  instance_type   = "t2.small"
  server_url      = ""
  java_max_memory = 1024
  personal_ip     = ""
  personal_subnet = 32
}
```
