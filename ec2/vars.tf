# aws_region          = "us-east-1"
# private_key_path    = "~/.aws/credentials"
# profile             = "prashanth9sa"
# key_name            = "kubernetes"

variable "aws_region" {
  default = "us-east-1"
}

variable "private_key_path" {
  default = "~/.aws/credentials"
}

variable "profile" {
  default = "prashanth"
}

variable "key_name" {
  default = "kubernetes"
}
