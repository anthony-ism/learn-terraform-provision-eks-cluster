locals {
  cluster_name    = "rizzo"
  cluster_version = "1.27"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}