# Copyright YYYY Google LLC
#
# This software is provided as-is, without warranty or representation for any
# use or purpose. Your use of it is subject to your agreement with Google.

variable "team_name" {
  type = string
}

variable "members" {
  type = list(any)
}

variable "github_org" {
  type = string
}

# currently only supports mapping 1 group to 1 repo
variable "repo_name" {
  type = string
}



