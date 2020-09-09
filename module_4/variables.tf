variable "aws_access_key" {
  type        = string
  description = "(This is the AWS access key. It must be provided, but it can also be sourced from the AWS_ACCESS_KEY_ID environment variable, or via a shared credentials file if profile is specified."
  default     = ""
}

variable "aws_secret_key" {
  type        = string
  description = "This is the AWS secret key. It must be provided, but it can also be sourced from the AWS_SECRET_ACCESS_KEY environment variable, or via a shared credentials file if profile is specified."
  default     = ""
}
variable "key_name" {
  type        = string
  description = "THe path to the key"
}
variable "private_key_path" {
  type        = string
  description = "THe path to the key"
}
variable "region" {
  default = "us-east-1"
}
variable "network_address_space" {
  default = "10.1.0.0/16"
}
variable "subnet1_address_space" {
  default = "10.1.0.0/24"
}
variable "subnet2_address_space" {
  default = "10.1.1.0/24"
}
