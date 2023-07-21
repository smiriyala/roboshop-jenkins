terraform {
  backend "s3" {
    bucket = "devopsterraform-s71"
    key = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
