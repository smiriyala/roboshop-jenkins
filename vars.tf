variable "folders" {
    default = ["infra", "CI-Pipeline"]
}

variable "m-jobs"{
    default = [
    
        { name = "frontend", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/frontend" },
        { name = "cart", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/cart" },
        { name = "catalogue", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/catalogue" },
        { name = "user", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/user" },
        { name = "shipping", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/shipping" },
        { name = "payment", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/payment" },
        { name = "dispatch", folder = "CI-Pipeline", repo_url = "https://github.com/smiriyala/dispatch" }
  
    ]
}

variable "s-jobs"{
    default = [
        { name = "roboshop", folder = "infra", repo_url = "https://github.com/smiriyala/roboshop-infra" }
    ]
}

variable "force"{
    default = false
}