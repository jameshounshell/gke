variable "kubernetes_version" {
  default = "1.27"
}

variable "workers_count" {
  default = "3"
}

variable "cluster_name" {
  type = string
  default = "meatcloud"
}

variable "idp_enabled" {
  type    = bool
  default = false
}

