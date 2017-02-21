// GitHub Provider
provider "github" {
  token        = "${var.github_token}"
  organization = "${var.github_organization}"
}

// john is a simple member of the organization
resource "github_membership" "membership_for_john" {
  username = "john"
  role     = "member"
}

// jane is an administrator of the organization
resource "github_membership" "membership_for_jane" {
  username = "jane"
  role     = "admin"
}

// An engineering team
resource "github_team" "engineering" {
  name        = "Engineering Team"
  description = "Our awesome engineers"
  privacy     = "secret"
}

// A documentation team
resource "github_team" "documentation" {
  name        = "Technical Writers Team"
  description = "Our awesome technical writers"
  privacy     = "closed"
}

// Jane is a member of the engineering team
resource "github_team_membership" "eng_membership_jane" {
  team_id  = "${github_team.engineering.id}"
  username = "jane"
  role     = "member"
}

// John is a member of the documentation team
resource "github_team_membership" "doc_membership_john" {
  team_id  = "${github_team.documentation.id}"
  username = "john"
  role     = "member"
}

// technical writers can pull the repo
resource "github_team_repository" "infrastructure_doc" {
  team_id    = "${github_team.documentation.id}"
  repository = "infrastructure-repository"
  permission = "pull"
}

// engineers are admin on the repo
resource "github_team_repository" "infrastructure_eng" {
  team_id    = "${github_team.engineering.id}"
  repository = "infrastructure-repository"
  permission = "admin"
}
