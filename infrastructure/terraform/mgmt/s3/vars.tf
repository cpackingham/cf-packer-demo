variable "bucket_name" {
  type = string
  description = "Name of the mgmt bucket."
  default = "mgmt-bucket"
}

variable "tags" {
  type = map(string)
  description = "Common tags to apply to mgmt resources."
}