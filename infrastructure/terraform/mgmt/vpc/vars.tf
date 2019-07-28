variable "mgmt_vpc_cidr_block" {
  type = string
  description = "The cidr block of the mgmt vpc."
  default = "10.0.0.0/16"
}

variable "tags" {
  type = map(string)
  description = "Common tags to apply to mgmt resources."
}