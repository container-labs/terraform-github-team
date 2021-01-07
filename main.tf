# Copyright YYYY Google LLC
#
# This software is provided as-is, without warranty or representation for any
# use or purpose. Your use of it is subject to your agreement with Google.

# repo creation not currently managed by TF
data "github_repository" "the_repo" {
  full_name = "${var.github_org}/${var.repo_name}"
}

resource "github_membership" "membership_for_some_user" {
  for_each = toset(var.members)

  username = each.key
  role     = "member"
}

resource "github_team" "some_team" {
  name        = var.team_name
  description = "TF managed team"
}

resource "github_team_membership" "some_team_membership" {
  for_each = toset(var.members)

  team_id  = github_team.some_team.id
  username = each.key
  role     = "member"
}

resource "github_team_repository" "some_team_repo" {
  team_id    = github_team.some_team.id
  repository = data.github_repository.the_repo.name
  permission = "push"
}
