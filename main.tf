resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name = element(var.folders, count.index)
}

resource "jenkins_job" "job" {
  count = length(var.jobs)
  name     = lookup(element(var.jobs, count.index), "name", null)
  folder   = lookup(element(var.jobs, count.index), "folder", null)
  template = templatefile("${path.module}/sb-job.xml", {
    description = "Roboshop infrastructure job created",
    repo_rul = lookup(element(var.jobs, count.index), "repo_url", null)
  })
}