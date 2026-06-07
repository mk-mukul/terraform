variable "region" {
    default = "us-east-1"
}

variable "environment" {
    default = "dev"
    type = string
}

variable "channel_name" {
    default = "general"
    type = string
}
