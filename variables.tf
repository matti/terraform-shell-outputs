variable "depends_id" {
  default = ""
}

variable "stdin" {
  type    = "string"
  default = ""
}

variable "envs" {
  type    = "map"
  default = {}
}

variable "chdir" {
  type    = "string"
  default = ""
}

variable "command" {}
