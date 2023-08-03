#This tf file helps to create OTHER COmponent level JENKSING JOBS when you run master job in jenkins. 
# Master job need to be created and pointing to this roboshop-jenkins repp.

resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name = element(var.folders, count.index)
}

resource "jenkins_job" "s-job" {
  depends_on = [jenkins_folder.folders]

  count = length(var.s-jobs)
  name     = lookup(element(var.s-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.s-jobs, count.index), "folder", null)}"
  
  ##These variable values are comming from varaible s-job
  template = templatefile("${path.module}/sb-job.xml", {
    description = "Roboshop infrastructure jobs created",
    repo_url = lookup(element(var.s-jobs, count.index), "repo_url", null)
    name = lookup(element(var.s-jobs, count.index), "name", null)
    filename = lookup(element(var.s-jobs, count.index), "filename", null)
  })

  /* lifecycle {
    ignore_changes = [template]
  } */
}

resource "jenkins_job" "m-job" {
  depends_on = [jenkins_folder.folders]

  count = length(var.m-jobs)
  name     = lookup(element(var.m-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.m-jobs, count.index), "folder", null)}"
  
  template = templatefile("${path.module}/mb-job.xml", {
    description = "Roboshop infrastructure job created",
    repo_url = lookup(element(var.m-jobs, count.index), "repo_url", null)
    name = lookup(element(var.m-jobs, count.index), "name", null)
  })

  /* lifecycle {
    ignore_changes = [template]
  } */
}


##These are defeult values place to create while JENKINS JOb Execution
## Instead of IP address, we can use jenkins.devopsforyou.online route53 entry created. 
data "aws_instance" "jenkins" {
  instance_id = "i-0557339025abd2c67"
}

resource "aws_route53_record" "jenkins" {
  zone_id = "Z034160419BHTFKQ5CIGO"
  name    = "jenkins.devopsforyou.online"
  type    = "A"
  ttl     = 30
  records = [data.aws_instance.jenkins.public_ip]
}