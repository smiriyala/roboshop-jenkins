variable "folders" {
    default =[ "infra"]
}
variable "jobs"{
    default = [
        { name = "roboshop", folder = "infra", repo_url = "https://github.com/smiriyala/roboshop-infra.git"}
    ]
}
