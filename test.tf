
terraform {
    backend "s3" {
        bucket = "s3backend-mg82pl5wbrihuk-state-bucket"
        key = "captain/arm"
        region = "us-west-2"
        encrypt = true
        role_arn = "arn:aws:iam::993526346936:role/s3backend-mg82pl5wbrihuk-tf-assume-role"
        dynamodb_table = "s3backend-mg82pl5wbrihuk-state-lock"
    }

    /*
    required_version = ">= 0.15"
    required_providers {
        null = {
            source = "hashicorp/null"
            version = "~> 3.0"
        }
    }
    */
   
}

resource "null_resource" "motto" {
    triggers = {
        always = timestamp()
    }
    provisioner "local-exec" {
        command = "echo gotta catch em all"
    }
}
