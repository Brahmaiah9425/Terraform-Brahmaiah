variable "sg-name" {
  description = "The name of the security group"
  type        = string
}

variable "sg-description" {
  description = "Allow TLS inbound traffic"
  type        = string
}

variable "inbound-from-port" {
  default = 0
}

variable "cidr_blocks" {
  default = [ "0.0.0.0/0" ]
  type    = list
}
