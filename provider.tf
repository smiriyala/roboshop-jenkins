terraform {
    required_providers {
        jenkins = {
            source = "registry.terraform.io/taiidani/jenkins"
        }
    }
}

provider "jenkins" {
    server_url = "http://3.95.200.98:8080/"
    username = data.aws_ssm_parameter.jenkins_user.value
    password = data.aws_ssm_parameter.jenkins_pass.value
}

data "aws_ssm_parameter" "jenkins_user" {
    name = "jenkins.user"
}

data "aws_ssm_parameter" "jenkins_pass" {
    name = "jenkins.pass"
}

provider "aws" {
    region = "us-east-1"
}