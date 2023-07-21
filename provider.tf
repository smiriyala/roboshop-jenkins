terraform{
    required_providers{
        jenkins = {
            source = "registry.terraform.io/taiidani/jenkins"
        }
    }
}

provider "Jenkins"{
    server_url = "http://52.2.35.11:8080"
    username = data.aws_ssm_parameter.jenkins_user.value
    password = data.aws_ssm_parameter.jenkins_pass.value
}

data "aws_ssm_parameter" "jenkins_user"{
    name = "jenkins_user"
}

data "aws_ssm_parameter" "jenkins_pass"{
    name = "jenkins_pass"
}