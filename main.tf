# Create repository: "cts-projects"
resource "github_repository" "cts-projects" {
  name        = "cts-projects"
  description = "CTS automated repository to manage projects"

  visibility  = "public"
  has_projects = true
}

# Create new project with the name of the service-instance and various service
# information in project body
resource "github_repository_project" "project" {
  repository = "${github_repository.cts-projects.name}"

  for_each = var.services
  name       = each.value.id
  body       = "Service Name: ${each.value.name}\nPort: ${each.value.port}"
}
